import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/search/controllers/PeriodicTableQuizController.dart';

class PeriodicTableQuizView extends StatelessWidget {
  const PeriodicTableQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final PeriodicTableQuizController controller = Get.put(PeriodicTableQuizController());

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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back(); // This will navigate to the previous screen
            },
          ),
          title: const Text('Periodic Table Quiz'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Text(
                  'Time Remaining: ${controller.timer.value} seconds',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                var question = controller.elements[controller.currentQuestionIndex.value];
                return Text(
                  'What is the name of element with atomic number ${question['atomicNumber']}?',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                );
              }),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.elements.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        controller.elements[index]['name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        if (!controller.isAnswered.value) {
                          controller.checkAnswer(controller.elements[index]['name']);
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return controller.isAnswered.value
                    ? ElevatedButton(
                        onPressed: () {
                          controller.nextQuestion();
                        },
                        child: const Text('Next Question'),
                      )
                    : Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
