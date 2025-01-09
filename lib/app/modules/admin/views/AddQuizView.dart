import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/admin/controllers/admin_controller.dart';

class AddQuizView extends StatelessWidget {
  const AddQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminDashboardController controller = Get.find();

    TextEditingController questionController = TextEditingController();
    TextEditingController option1Controller = TextEditingController();
    TextEditingController option2Controller = TextEditingController();
    TextEditingController option3Controller = TextEditingController();
    TextEditingController option4Controller = TextEditingController();
    TextEditingController correctAnswerController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Quiz'),
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
                QuizModel newQuiz = QuizModel(
                  question: questionController.text,
                  options: [
                    option1Controller.text,
                    option2Controller.text,
                    option3Controller.text,
                    option4Controller.text,
                  ],
                  correctAnswer: correctAnswerController.text,
                );
                controller.addQuiz(newQuiz);
                Get.back();
              },
              child: const Text('Add Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
