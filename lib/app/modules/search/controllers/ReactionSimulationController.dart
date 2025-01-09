import 'package:get/get.dart';

class ReactionSimulationController extends GetxController {
  RxString element1 = ''.obs;
  RxString element2 = ''.obs;
  RxString reactionResult = ''.obs;

  // List of elements
  final List<String> elements = [
    'H', 'O', 'Na', 'Cl', 'C', 'K', 'N', 'Mg', 'Ca', 'Fe', 'Cu', 'Ag'
  ];

  // Method to simulate chemical reaction
  void simulateReaction() {
    if (element1.value.isEmpty || element2.value.isEmpty) {
      reactionResult.value = "Please select two elements.";
      return;
    }

    // Example reactions (can be expanded or replaced with real data)
    final reactions = {
      'H+O': 'H2O (Water)',
      'Na+Cl': 'NaCl (Salt)',
      'C+O': 'CO2 (Carbon Dioxide)',
      'H+Cl': 'HCl (Hydrochloric Acid)',
      'Fe+O': 'Fe2O3 (Rust)',
    };

    // Generate reaction key
    final reactionKey1 = '${element1.value}+${element2.value}';
    final reactionKey2 = '${element2.value}+${element1.value}';

    // Check for a matching reaction
    if (reactions.containsKey(reactionKey1)) {
      reactionResult.value = reactions[reactionKey1]!;
    } else if (reactions.containsKey(reactionKey2)) {
      reactionResult.value = reactions[reactionKey2]!;
    } else {
      reactionResult.value = "No reaction occurs between ${element1.value} and ${element2.value}.";
    }
  }

  // Method to reset the simulation
  void resetSimulation() {
    element1.value = '';
    element2.value = '';
    reactionResult.value = '';
  }
}
