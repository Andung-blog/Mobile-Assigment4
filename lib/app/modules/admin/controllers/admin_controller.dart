// Controller
import 'package:get/get.dart';

class AdminDashboardController extends GetxController {
  // List of elements
  var elements = <ElementModel>[
    ElementModel(symbol: 'H', name: 'Hydrogen', atomicNumber: 1),
    ElementModel(symbol: 'He', name: 'Helium', atomicNumber: 2),
    ElementModel(symbol: 'Li', name: 'Lithium', atomicNumber: 3),
    ElementModel(symbol: 'Be', name: 'Beryllium', atomicNumber: 4),
    ElementModel(symbol: 'B', name: 'Boron', atomicNumber: 5),
  ].obs;

  var quizzes = <QuizModel>[].obs;

  // Method to update an element
  void updateElement(int index, ElementModel updatedElement) {
    elements[index] = updatedElement;
  }

  // Method to add a quiz
  void addQuiz(QuizModel quiz) {
    quizzes.add(quiz);
  }

  // Method to update a quiz
  void updateQuiz(int index, QuizModel updatedQuiz) {
    quizzes[index] = updatedQuiz;
  }

  // Method to delete a quiz
  void deleteQuiz(int index) {
    quizzes.removeAt(index);
  }
}

// Model
class ElementModel {
  final String symbol;
  final String name;
  final int atomicNumber;

  ElementModel({
    required this.symbol,
    required this.name,
    required this.atomicNumber,
  });
}

class QuizModel {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
