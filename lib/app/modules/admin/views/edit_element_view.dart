import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/admin/controllers/admin_controller.dart';

class EditElementView extends StatelessWidget {
  final int index; // Index elemen yang akan diedit
  final TextEditingController symbolController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController atomicNumberController = TextEditingController();

  EditElementView({super.key, required this.index}) {
    final element = Get.find<AdminDashboardController>().elements[index];
    symbolController.text = element.symbol;
    nameController.text = element.name;
    atomicNumberController.text = element.atomicNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    final AdminDashboardController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Element',
          style: TextStyle(color: Colors.white), // Title berwarna putih
        ),
        backgroundColor: const Color(0xFF21005D),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Icon back arrow berwarna putih
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Edit Element Data',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF21005D),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: symbolController,
                        decoration:
                            const InputDecoration(labelText: 'Symbol'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: atomicNumberController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Atomic Number'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Perbarui elemen di controller
                        final updatedElement = ElementModel(
                          symbol: symbolController.text,
                          name: nameController.text,
                          atomicNumber:
                              int.parse(atomicNumberController.text),
                        );
                        controller.updateElement(index, updatedElement);

                        // Kembali ke halaman sebelumnya
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF21005D),
                        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
