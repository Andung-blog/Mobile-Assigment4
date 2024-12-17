import 'package:flutter/material.dart';

class HidrogenView extends StatelessWidget {
  final String symbol;
  final String elementName;
  final int atomicNumber;
  final String atomicWeight;
  final String configuration;
  final String group;
  final String period;

  // Constructor with required parameters
  const HidrogenView({
    super.key,
    required this.symbol,
    required this.elementName,
    required this.atomicNumber,
    required this.atomicWeight,
    required this.configuration,
    required this.group,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(elementName),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Symbol: $symbol'),
            Text('Atomic Number: $atomicNumber'),
            Text('Atomic Weight: $atomicWeight'),
            Text('Configuration: $configuration'),
            Text('Group: $group'),
            Text('Period: $period'),
          ],
        ),
      ),
    );
  }
}
