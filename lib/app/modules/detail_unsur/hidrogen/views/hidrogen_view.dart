import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/detail_unsur/hidrogen/controllers/hidrogen_controller.dart';

class HidrogenView extends GetView<HidrogenController> {
  const HidrogenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the HidrogenController
    Get.lazyPut(() => HidrogenController());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                HidrogenPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HidrogenPage extends StatelessWidget {
  const HidrogenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the controller using GetX
    final controller = Get.find<HidrogenController>();

    return Column(
      children: [
        Container(
          width: 440,
          height: 1838,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF083852), Color(0xFF0C547B), Color(0xFF127EB8)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 43,
                top: 86,
                child: SizedBox(
                  width: 389,
                  height: 684,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 1,
                        top: 28,
                        child: SizedBox(
                          width: 342,
                          height: 124,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 1,
                                top: 0,
                                child: SizedBox(
                                  width: 76,
                                  height: 60,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(255, 255, 255, 255), // Border color (stroke)
                                        width: 1,                                        // Border width (stroke width)
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          5), // Optional: for rounded corners
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.symbol
                                            .value, // Using data from controller
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 36,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 65,
                                child: SizedBox(
                                  width: 342,
                                  height: 59,
                                  child: Text(
                                    controller.elementName
                                        .value, // Using data from controller
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 48,
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
                        left: 196,
                        top: 0,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 33, 149,
                                243), // Set a background color (optional)
                            borderRadius:
                                BorderRadius.circular(50), // Rounded corners
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              ),
                            ],
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 255, 255, 255), // Border color (stroke)
                              width: 2, // Border width (stroke width)
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'Hi', // Text in the center
                                style: TextStyle(
                                  fontSize: 24, // Font size
                                  fontWeight: FontWeight.bold, // Text weight
                                  color: Colors.white,
                                  // Text color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 215,
                        child: SizedBox(
                          width: 364,
                          height: 469,
                          child: Text(
                            'Nomor Atom: ${controller.atomicNumber.value}\n\n'
                            'Golongan: ${controller.group.value}\n\n'
                            'Periode: ${controller.period.value}\n\n'
                            'Kategori Unsur: Gas Mulia\n\n'
                            'Berat Atom: ${controller.atomicWeight.value}\n\n'
                            'Konfigurasi Elektron: ${controller.configuration.value}\n\n',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
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
                left: 27,
                top: 47,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    // Navigate to Home when clicked
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}