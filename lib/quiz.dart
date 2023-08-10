import 'package:flutter/material.dart';
import 'package:quizer/answer_screen.dart';
import 'package:quizer/questioins.dart';
import 'package:quizer/question_screen.dart';
import 'package:quizer/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  Widget? screeWidget;
  var activeScreen = "start-screen";

  void chooseAnswer(answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void onRestartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    screeWidget = StartScreen(switchScreen);
    if (activeScreen == "question-screen") {
      screeWidget = Questions(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == "start-screen") {
      screeWidget = StartScreen(switchScreen);
    }
    if (activeScreen == "result-screen") {
      screeWidget = Answerr(
        onRestart: onRestartQuiz,
        choosenAnswer: selectedAnswer,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 96, 11, 175),
              Color.fromARGB(255, 128, 11, 151)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screeWidget,
        ),
      ),
    );
  }
}
