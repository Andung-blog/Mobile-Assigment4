import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:myapp/app/modules/detail_unsur/hidrogen/views/hidrogen_view.dart';
import 'package:myapp/app/modules/search/views/search_explore_view.dart';
import 'package:myapp/app/modules/setting/views/settings_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger the special event check
    controller.checkSpecialEvent();

    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: controller.currentTheme.value.copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
        ),
        home: Scaffold(
          body: Stack(
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      HomePage(),
                    ],
                  ),
                ),
              ),
              // Display popup message for special events
              _buildPopupMessage(context),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildPopupMessage(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.defaultDialog(
        title: 'Special Event!',
        titleStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: controller.popupColor.value,
        ),
        content: Column(
          children: [
            Icon(
              controller.popupIcon.value,
              size: 60,
              color: controller.popupColor.value,
            ),
            const SizedBox(height: 10),
            Text(
              controller.popupMessage.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: controller.popupColor.value,
              ),
            ),
          ],
        ),
        barrierDismissible: false,
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: controller.popupColor.value,
          ),
          child: const Text("OK"),
        ),
      );
    });

    return Container(); // Placeholder untuk logika popup
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1253,
          height: 956,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF030B3E), Color(0xFF0D1E89)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 51,
                top: 285,
                child: SizedBox(
                  width: 56,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 56,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFF8804A)),
                        ),
                      ),
                      const Positioned(
                        left: 5,
                        top: 1,
                        child: Text(
                          '3\nLi\nLitium\n6,94',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 395,
                child: SizedBox(
                  width: 56,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 56,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFF8804A)),
                        ),
                      ),
                      const Positioned(
                        left: 5,
                        top: 3,
                        child: Text(
                          '19\nK\nKalium\n39,098',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 450,
                child: SizedBox(
                  width: 56,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 56,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFF8804A)),
                        ),
                      ),
                      const Positioned(
                        left: 5,
                        top: 1,
                        child: Text(
                          '37\nRb\nRubidium\n85,468',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 340,
                child: SizedBox(
                  width: 56,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 56,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFF8804A)),
                        ),
                      ),
                      const Positioned(
                        left: 5,
                        top: 3,
                        child: Text(
                          '11\nNa\nNatrium\n22,990',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 230,
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const HidrogenView(),
                      arguments: {
                        'symbol': 'H',
                        'elementName': 'Hydrogen',
                        'atomicNumber': 1,
                        'atomicWeight': '1.008',
                        'configuration': '1s1',
                        'group': '1',
                        'period': '1',
                      },
                    );
                  },
                  child: SizedBox(
                    width: 56,
                    height: 51,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 56,
                            height: 51,
                            decoration:
                                const BoxDecoration(color: Color(0xFF5EEF2C)),
                          ),
                        ),
                        const Positioned(
                          left: 5,
                          top: 0,
                          child: SizedBox(
                            width: 51,
                            height: 49,
                            child: Text(
                              '1\nH\nHidrogen\n1,008',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 505,
                child: SizedBox(
                  width: 56,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 56,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFF8804A)),
                        ),
                      ),
                      const Positioned(
                        left: 5,
                        top: 0,
                        child: Text(
                          '55\nCs\nSesium\n132,91',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 560,
                child: SizedBox(
                  width: 56,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 56,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFF8804A)),
                        ),
                      ),
                      const Positioned(
                        left: 5,
                        top: 0,
                        child: Text(
                          '87\nFr\nFransium\n(223)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFEE0C)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '20\nCa\nKalsium\n40,078',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 175,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '21\nSc\nSkandium\n44,956',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 175,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '39\nY\nItrium\n88,906',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 367,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '24\nCr\nKromium\n51,996',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 367,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '42\nMo\nMolibdenum\n95,95',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 559,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '27\nCo\nKobalt\n58,933',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 751,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '30\nZn\nSeng\n65,38',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 339,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '13\nAl\nAluminium\n26,982',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 284,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '20\nCa\nKalsium\n40,078',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 284,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '20\nCa\nKalsium\n40,078',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 284,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '5\nB\nBoron\n10,81',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 878,
                top: 284,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF5EEF2C)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '6\nC\nKarbon\n12,011',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 942,
                top: 284,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF5EEF2C)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '7\nN\nNitrogen\n14,007',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 942,
                top: 339,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF5EEF2C)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '15\nP\nFosfor\n30,974',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1006,
                top: 339,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF5EEF2C)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '16\nS\nBelerang\n32,06',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1006,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF5EEF2C)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '34\nSe\nSelenium\n78,971',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1006,
                top: 284,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF5EEF2C)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '8\nO\nOksigen\n15,999',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1070,
                top: 284,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF00DDBB)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '9\nF\nFluorin\n18,998',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1134,
                top: 229,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF66AAFF)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '20\nCa\nKalsium\n40,078',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1134,
                top: 284,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF66AAFF)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '10\nNe\nNeon\n20,180',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1134,
                top: 339,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF66AAFF)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '18\nAr\nArgon\n39,94',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1134,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF66AAFF)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '36\nKr\nKripton\n83,798',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1134,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF66AAFF)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '54\nXe\nXenon\n131,29',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1134,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF66AAFF)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '86\nRn\nRadon\n(222)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1134,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF66AAFF)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '118\nOg\nOganeson\n(294)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1070,
                top: 339,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF00DDBB)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '17\nCl\nKlorin\n35,45',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1070,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF00DDBB)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '35\nBr\nBromin\n79,904',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1070,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF00DDBB)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '53\nI\nIodin\n126,90',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1070,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF00DDBB)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '85\nAt\nAstatin\n(210)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1070,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF00DDBB)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '117\nTs\nTenesin\n(294)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 878,
                top: 339,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '14\nSi\nSilikon\n28,085',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 878,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '32\nGe\nGermanium\n72,630',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 942,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '33\nAs\nArsen\n74,922',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 942,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '51\nSb\nAntimon\n121,76',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1006,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '52\nTe\nTelurium\n127,60',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1006,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xDD4BD462)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '84\nPo\nPolonium\n(209)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '20\nCa\nKalsium\n40,078',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '31\nGa\nGalium\n69,723',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '49\nIn\nIndium\n114,82',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 878,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '50\nSn\nTimah\n118,71',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '81\nTl\nTalium\n204,38',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 878,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '82\nPb\nTimbal\n207,2',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 942,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '83\nBi\nBismut\n208,98',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 814,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '113\nNh\nNihonium\n(286)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 878,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '114\nFl\nFlerovium\n(289)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 942,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '115\nMc\nMoskovium\n(290)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1006,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFF99BBAA)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '116\nLv\nLivermorium\n(293)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 687,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '29\nCu\nTembaga\n63,546',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 623,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '28\nNi\nNikel\n58,693',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 495,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '26\nFe\nBesi\n55,845',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 495,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '44\nRu\nRutenium\n101,07',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 559,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '45\nRh\nRodium\n102,91',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 623,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '46\nPd\nPaladium\n106,42',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 687,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '47\nAg\nPerak\n107,87',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 751,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '48\nCd\nKadmium\n112,41',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 431,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '25\nMn\nManganese\n54,938',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 431,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '43\nTc\nTeknesium\n(98)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 303,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '23\nV\nVanadium\n40,078',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 303,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '41\nNb\nNiobium\n92,906',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 239,
                top: 395,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '22\nTi\nTitanium\n47,867',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 239,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '40\nZr\nZirkonium\n91,224',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 239,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '22\nTi\nTitanium\n47,867',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 239,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '72\nHf\nHafnium\n178,49',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 239,
                top: 560,
                child: SizedBox(
                  width: 62,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '104\nRf\nRuterfordium\n(267)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 303,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '73\nTa\nTantalum\n180,95',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 303,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '105\nDb\nDubnium\n(268)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 367,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '74\nW\nWolfram\n183,84',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 367,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '106\nSg\nSeaborgium\n(269)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 431,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '75\nRe\nRenium\n186,21',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 431,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '107\nBh\nBohrium\n(270)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 495,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '76\nOs\nOsmium\n190,23',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 495,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '108\nHs\nHasium\n(277)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 559,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '77\nIr\nIridium\n192,22',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 559,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '109\nMt\nMeitnerium\n(278)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 623,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '78\nPt\nPlatina\n195,08',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 623,
                top: 560,
                child: SizedBox(
                  width: 66,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '110\nDs\nDarmstadtium\n(281)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 687,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '79\nAu\nEmas\n196,9',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 687,
                top: 560,
                child: SizedBox(
                  width: 62,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '111\nRg\nRoentgenium\n(282)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 751,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '80\nHg\nRaksa\n200,59',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 751,
                top: 560,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFB4B4)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 2,
                        child: Text(
                          '112\nCn\nKopernisium\n(285)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 559,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0.98,
                        child: Container(
                          width: 60,
                          height: 50.02,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFEE0C)),
                        ),
                      ),
                      const Positioned(
                        left: 3,
                        top: 0,
                        child: SizedBox(
                          width: 37,
                          height: 47.08,
                          child: Text(
                            '88\nRa\nRadium\n(226)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 9,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 175,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 239,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 303,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 367,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 431,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 495,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 559,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 623,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 687,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 751,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 815,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 879,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 943,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 1007,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 1071,
                top: 737,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFBBAADD)),
                ),
              ),
              Positioned(
                left: 111,
                top: 340,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFEE0C)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 1,
                        child: Text(
                          '12\nMg\nMagnesium\n24,305',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 285,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFEE0C)),
                        ),
                      ),
                      const Positioned(
                        left: 3,
                        top: 1,
                        child: Text(
                          '4\nBe\nBerilium\n9,0122',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 450,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFEE0C)),
                        ),
                      ),
                      const Positioned(
                        left: 3,
                        top: 1,
                        child: Text(
                          '38\nSr\nStronsium\n87,62',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFEE0C)),
                        ),
                      ),
                      const Positioned(
                        left: 3,
                        top: 0,
                        child: Text(
                          '56\nBa\nBarium\n137,33',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 175,
                top: 505,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFDDAACC)),
                        ),
                      ),
                      const Positioned(
                        left: 16,
                        top: 20,
                        child: Text(
                          '51-71*',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 175,
                top: 666,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFDDAACC)),
                        ),
                      ),
                      const Positioned(
                        left: 3,
                        top: 2,
                        child: Text(
                          '57\nLa\nLantanum\n138,91',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 239,
                top: 666,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFDDAACC)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 0,
                        child: Text(
                          '58\nCe\nSerium\n140,12`',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 303,
                top: 666,
                child: SizedBox(
                  width: 74,
                  height: 54,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFDDAACC)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 0,
                        child: SizedBox(
                          width: 70,
                          height: 54,
                          child: Text(
                            '59\nPr\nPraseodimium\n140,91',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 9,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 367,
                top: 666,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFDDAACC)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 0,
                        child: Text(
                          '60\nNd\nNeodimium\n144,24`',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 431,
                top: 666,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFDDAACC)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 0,
                        child: Text(
                          '61\nPm\nPrometium\n(145)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 495,
                top: 666,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFDDAACC)),
                        ),
                      ),
                      const Positioned(
                        left: 4,
                        top: 0,
                        child: Text(
                          '62\nSm\nSamarium\n150,36',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 559,
                top: 666,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFDDAACC)),
                        ),
                      ),
                      const Positioned(
                        left: 5,
                        top: 0,
                        child: Text(
                          '63\nEu\nEuropium\n151,96',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 623,
                top: 666,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFDDAACC)),
                ),
              ),
              Positioned(
                left: 687,
                top: 666,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFDDAACC)),
                ),
              ),
              Positioned(
                left: 751,
                top: 666,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFDDAACC)),
                ),
              ),
              Positioned(
                left: 815,
                top: 666,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFDDAACC)),
                ),
              ),
              Positioned(
                left: 879,
                top: 666,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFDDAACC)),
                ),
              ),
              Positioned(
                left: 943,
                top: 666,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFDDAACC)),
                ),
              ),
              Positioned(
                left: 1007,
                top: 666,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFDDAACC)),
                ),
              ),
              Positioned(
                left: 1071,
                top: 666,
                child: Container(
                  width: 60,
                  height: 51,
                  decoration: const BoxDecoration(color: Color(0xFFDDAACC)),
                ),
              ),
              Positioned(
                left: 175,
                top: 559,
                child: SizedBox(
                  width: 60,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 51,
                          decoration:
                              const BoxDecoration(color: Color(0xFFBBAADD)),
                        ),
                      ),
                      const Positioned(
                        left: 9,
                        top: 21,
                        child: Text(
                          '89-103**',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFF21005D), // Navbar background color
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 116,
                        top: 56,
                        child: SizedBox(
                          width: 177,
                          height: 54,
                          child: Text(
                            'Tabel Periodik',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 338,
                        top: 50,
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the SearchExploreView when the icon is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchExploreView(),
                              ),
                            );
                          },
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 44,
                        top: 50,
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the SettingsView when the icon is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsView(),
                              ),
                            );
                          },
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.settings,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
