import 'package:flutter/material.dart';
import 'package:quizer/button_style.dart';
import 'package:quizer/questioins.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectedAnswer});
  @override
  State<Questions> createState() => _QuestionsState();
  final void Function(String answer) onSelectedAnswer;
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  var currentQuestion = questions[0];
  void updateCurrentQuestion() {
    if (currentQuestionIndex < questions.length) {
      currentQuestion = questions[currentQuestionIndex];
    }
  }

  void nextQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestion = questions[currentQuestionIndex + 1];
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Button_Style(
                  answerText: answer,
                  onTap: () {
                    nextQuestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
