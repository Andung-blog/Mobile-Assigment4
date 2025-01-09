import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/search/controllers/ReactionSimulationController.dart';

class ReactionSimulationView extends StatelessWidget {
  final ReactionSimulationController controller =
      Get.put(ReactionSimulationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemical Reaction Simulation'),
        centerTitle: true,
        backgroundColor: const Color(0xFF21005D),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select Two Elements to Simulate Reaction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => DropdownButton<String>(
                      value: controller.element1.value.isEmpty
                          ? null
                          : controller.element1.value,
                      hint: const Text('Element 1'),
                      items: controller.elements.map((String element) {
                        return DropdownMenuItem<String>(
                          value: element,
                          child: Text(element),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.element1.value = value!;
                      },
                    )),
                Obx(() => DropdownButton<String>(
                      value: controller.element2.value.isEmpty
                          ? null
                          : controller.element2.value,
                      hint: const Text('Element 2'),
                      items: controller.elements.map((String element) {
                        return DropdownMenuItem<String>(
                          value: element,
                          child: Text(element),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.element2.value = value!;
                      },
                    )),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.simulateReaction,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF21005D),
                foregroundColor: Colors.white, // Updated parameter
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text('Simulate Reaction'),
            ),
            const SizedBox(height: 24),
            Obx(() => Text(
                  controller.reactionResult.value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.resetSimulation,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white,// Updated parameter
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
