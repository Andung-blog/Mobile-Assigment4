import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MolecularCalculatorController extends GetxController {
  // Atomic weights for example elements
  final Map<String, double> atomicWeights = {
    'Hydrogen': 1.008,
    'Oxygen': 15.999,
    'Carbon': 12.011,
    'Nitrogen': 14.007,
    'Sulfur': 32.065,
    'Chlorine': 35.45,
  };

  // User-selected elements and their quantities
  RxMap<String, int> selectedElements = <String, int>{}.obs;

  // Total molecular mass
  RxDouble totalMass = 0.0.obs;

  // Method to add element and quantity to selected elements
  void addElement(String element, int quantity) {
    selectedElements[element] = quantity;
    calculateMolecularMass();
  }

  // Method to update quantity of an existing element
  void updateElement(String element, int quantity) {
    if (selectedElements.containsKey(element)) {
      selectedElements[element] = quantity;
      calculateMolecularMass();
    }
  }

  // Method to remove element
  void removeElement(String element) {
    selectedElements.remove(element);
    calculateMolecularMass();
  }

  // Calculate total molecular mass based on selected elements
  void calculateMolecularMass() {
    double mass = 0.0;
    selectedElements.forEach((element, quantity) {
      mass += atomicWeights[element]! * quantity;
    });
    totalMass.value = mass;
  }
}

class MolecularCalculatorView extends StatelessWidget {
  const MolecularCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    final MolecularCalculatorController controller = Get.put(MolecularCalculatorController());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        scaffoldBackgroundColor: const Color(0xFF1F2A3E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF21005D),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Molecular Calculator'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();  // Navigate back to SearchExploreView
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display selected elements and their quantities
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.selectedElements.length,
                  itemBuilder: (context, index) {
                    String element = controller.selectedElements.keys.toList()[index];
                    int quantity = controller.selectedElements[element]!;
                    return ListTile(
                      title: Text('$element x $quantity'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit Button for updating quantity
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // Show a dialog to update quantity
                              _showUpdateDialog(context, element, quantity);
                            },
                          ),
                          // Delete Button
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () {
                              controller.removeElement(element);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
              const SizedBox(height: 20),

              // Display available elements to add
              const Text(
                'Select Elements and Quantity:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.atomicWeights.keys.length,
                  itemBuilder: (context, index) {
                    String element = controller.atomicWeights.keys.toList()[index];
                    return ListTile(
                      title: Text(element),
                      subtitle: Text('Atomic Weight: ${controller.atomicWeights[element]} g/mol'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          controller.addElement(element, 1); // Default quantity is 1
                        },
                        child: const Text('Add'),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Display total molecular mass
              Obx(() {
                return Text(
                  'Total Molecular Mass: ${controller.totalMass.value.toStringAsFixed(2)} g/mol',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Show dialog to update quantity
  void _showUpdateDialog(BuildContext context, String element, int currentQuantity) {
    final TextEditingController quantityController = TextEditingController(text: currentQuantity.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Quantity'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantity',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                int updatedQuantity = int.tryParse(quantityController.text) ?? currentQuantity;
                Get.find<MolecularCalculatorController>().updateElement(element, updatedQuantity);
                Get.back();
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
