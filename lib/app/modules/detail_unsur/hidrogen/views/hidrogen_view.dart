import 'package:flutter/material.dart';

class HidrogenView extends StatelessWidget {
  final dynamic element; // Accept the element data

  const HidrogenView({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Element'),
        backgroundColor: const Color(0xFF21005D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Element: ${element.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF21005D)),
            ),
            const SizedBox(height: 20),
            Text('Symbol: ${element.symbol}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Name: ${element.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Atomic Number: ${element.atomicNumber}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save or further editing logic here
              },
              child: const Text('Save Changes'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF21005D)),
            ),
          ],
        ),
      ),
    );
  }
}
