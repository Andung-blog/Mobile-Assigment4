import 'package:get/get.dart';
import 'package:myapp/app/modules/search/views/ScoreScreen.dart';

class PeriodicTableQuizController extends GetxController {
  final List<Map<String, dynamic>> elements = [
    {'name': 'Hydrogen', 'atomicNumber': 1, 'atomicWeight': 1.008, 'type': 'Nonmetal'},
    {'name': 'Helium', 'atomicNumber': 2, 'atomicWeight': 4.0026, 'type': 'Noble Gas'},
    {'name': 'Lithium', 'atomicNumber': 3, 'atomicWeight': 6.94, 'type': 'Metal'},
    {'name': 'Beryllium', 'atomicNumber': 4, 'atomicWeight': 9.0122, 'type': 'Metal'},
    {'name': 'Boron', 'atomicNumber': 5, 'atomicWeight': 10.81, 'type': 'Metalloid'},
    {'name': 'Carbon', 'atomicNumber': 6, 'atomicWeight': 12.011, 'type': 'Nonmetal'},
  ];

  var currentQuestionIndex = 0.obs;
  var score = 0.obs;
  var timer = 30.obs;
  var isAnswered = false.obs;
  var userAnswer = ''.obs;

  void startQuiz() {
    score.value = 0;
    currentQuestionIndex.value = 0;
    timer.value = 30;
    isAnswered.value = false;
    userAnswer.value = '';
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (timer.value > 0 && !isAnswered.value) {
        timer.value--;
        startTimer();
      } else if (timer.value == 0) {
        nextQuestion();
      }
    });
  }

  void checkAnswer(String answer) {
    var correctAnswer = elements[currentQuestionIndex.value]['name'];
    if (answer == correctAnswer) {
      score.value++;
    }
    isAnswered.value = true;
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < elements.length - 1) {
      currentQuestionIndex.value++;
    } else {
      Get.to(ScoreScreen(score: score.value, total: elements.length));
    }
    isAnswered.value = false;
    userAnswer.value = '';
  }
}
