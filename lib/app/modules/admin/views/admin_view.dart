import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/admin/controllers/admin_controller.dart';
import 'package:myapp/app/modules/detail_unsur/hidrogen/bindings/hidrogen_binding.dart';
import 'package:myapp/app/modules/detail_unsur/hidrogen/views/hidrogen_view.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminDashboardController controller =
        Get.put(AdminDashboardController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF21005D),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Vertical scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Periodic Table',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF21005D),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'The periodic table organizes chemical elements by their atomic number, electron configurations, and recurring properties.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Element Data',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3F2E7B),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                // Horizontal scrolling for DataTable
                scrollDirection: Axis.horizontal,
                child: Obx(
                    () => // Example: Navigating from the AdminDashboardView to HidrogenView
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Symbol')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Atomic Number')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: controller.elements.map((element) {
                            return DataRow(cells: [
                              DataCell(Text(element.symbol)),
                              DataCell(Text(element.name)),
                              DataCell(Text(element.atomicNumber.toString())),
                              DataCell(
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Navigate and pass the selected element's data to HidrogenView
                                    Get.to(
                                      () => HidrogenView(
                                        symbol: element.symbol,
                                        elementName: element.name,
                                        atomicNumber: element.atomicNumber,
                                        atomicWeight:
                                            'Atomic Weight Placeholder', // Replace with actual data
                                        configuration:
                                            'Configuration Placeholder', // Replace with actual data
                                        group:
                                            'Group Placeholder', // Replace with actual data
                                        period:
                                            'Period Placeholder', // Replace with actual data
                                      ),
                                      binding: HidrogenBinding(),
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                  label: const Text('Edit'),
                                ),
                              ),
                            ]);
                          }).toList(),
                        )),
              ),
              const SizedBox(height: 30),
              // Logout Button (placed at the bottom)
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.back(); // Navigate back to the login screen
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text('Logout',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF21005D)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
