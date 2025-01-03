import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/detail_unsur/hidrogen/controllers/hidrogen_controller.dart';

class HidrogenView extends StatelessWidget {
  const HidrogenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Bind the controller to the view
    final HidrogenController controller = Get.put(HidrogenController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5E35B1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () {
            Get.back(); // Navigate back
          },
        ),
        title: Obx(() => Text(
              controller.elementName.value,
              style: const TextStyle(
                color: Colors.white, // White text for the title
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7E57C2), Color(0xFF5E35B1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _infoCard('Symbol', controller.symbol.value),
                          _infoCard('Atomic Number', controller.atomicNumber.value.toString()),
                          _infoCard('Atomic Weight', controller.atomicWeight.value),
                          _infoCard('Configuration', controller.configuration.value),
                          _infoCard('Group', controller.group.value),
                          _infoCard('Period', controller.period.value),
                        ],
                      ),
                      const SizedBox(width: 20), // Spacer between columns
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _infoCard('Extra Info 1', 'Placeholder'),
                          _infoCard('Extra Info 2', 'Placeholder'),
                          _infoCard('Extra Info 3', 'Placeholder'),
                          _infoCard('Extra Info 4', 'Placeholder'),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  // Widget for each piece of information
  Widget _infoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF).withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
