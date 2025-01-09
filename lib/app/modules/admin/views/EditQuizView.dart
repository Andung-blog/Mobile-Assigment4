import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/admin/controllers/admin_controller.dart';

class EditQuizView extends StatelessWidget {
  final int index;
  const EditQuizView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final AdminDashboardController controller = Get.find();
    final quiz = controller.quizzes[index];

    // Controllers for input fields
    TextEditingController questionController =
        TextEditingController(text: quiz.question);
    TextEditingController option1Controller =
        TextEditingController(text: quiz.options[0]);
    TextEditingController option2Controller =
        TextEditingController(text: quiz.options[1]);
    TextEditingController option3Controller =
        TextEditingController(text: quiz.options[2]);
    TextEditingController option4Controller =
        TextEditingController(text: quiz.options[3]);
    TextEditingController correctAnswerController =
        TextEditingController(text: quiz.correctAnswer);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Quiz'),
        backgroundColor: const Color(0xFF21005D),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: option1Controller,
              decoration: const InputDecoration(labelText: 'Option 1'),
            ),
            TextField(
              controller: option2Controller,
              decoration: const InputDecoration(labelText: 'Option 2'),
            ),
            TextField(
              controller: option3Controller,
              decoration: const InputDecoration(labelText: 'Option 3'),
            ),
            TextField(
              controller: option4Controller,
              decoration: const InputDecoration(labelText: 'Option 4'),
            ),
            TextField(
              controller: correctAnswerController,
              decoration: const InputDecoration(labelText: 'Correct Answer'),
            ),
            ElevatedButton(
              onPressed: () {
                QuizModel updatedQuiz = QuizModel(
                  question: questionController.text,
                  options: [
                    option1Controller.text,
                    option2Controller.text,
                    option3Controller.text,
                    option4Controller.text,
                  ],
                  correctAnswer: correctAnswerController.text,
                );
                controller.updateQuiz(index, updatedQuiz);
                Get.back();  // Go back to the Admin Dashboard
              },
              child: const Text('Update Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
