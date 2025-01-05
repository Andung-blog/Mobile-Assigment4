import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/detail_unsur/hidrogen/controllers/hidrogen_controller.dart';

class HidrogenView extends StatelessWidget {
  const HidrogenView({super.key});

  @override
  Widget build(BuildContext context) {
    final HidrogenController controller = Get.put(HidrogenController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5E35B1),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: Obx(() => Text(
              controller.elementName.value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Obx(() => Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _infoCard('Symbol', controller.symbol.value),
                  _infoCard('Atomic Number',
                      controller.atomicNumber.value.toString()),
                  _infoCard('Atomic Weight', controller.atomicWeight.value),
                  _infoCard('Configuration', controller.configuration.value),
                  _infoCard('Group', controller.group.value),
                  _infoCard('Period', controller.period.value),
                  _infoCard('Extra Info 1', 'Placeholder'),
                  _infoCard('Extra Info 2', 'Placeholder'),
                  _infoCard('Extra Info 3', 'Placeholder'),
                  _infoCard('Extra Info 4', 'Placeholder'),
                ],
              )),
        ),
      ),
    );
  }

  // Widget for modern info card with hover animation
  Widget _infoCard(String title, String value) {
    final isHovered = false.obs;

    return Obx(() => GestureDetector(
          onTapDown: (_) =>
              isHovered.value = true, // Saat disentuh, aktifkan animasi
          onTapUp: (_) =>
              isHovered.value = false, // Setelah disentuh, kembalikan animasi
          onTapCancel: () => isHovered.value =
              false, // Jika sentuhan dibatalkan, kembalikan animasi
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: 160,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isHovered.value
                  ? Colors.white
                      .withOpacity(1.0) // Warna lebih terang saat disentuh
                  : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: isHovered.value
                      ? 20
                      : 10, // Blur lebih besar saat disentuh
                  offset: isHovered.value
                      ? const Offset(0, 10)
                      : const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF5E35B1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
