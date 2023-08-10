import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizer/questioins.dart';
import 'package:quizer/question_summary.dart';

class Answerr extends StatelessWidget {
  const Answerr(
      {Key? key, required this.choosenAnswer, required this.onRestart})
      : super(key: key);

  final List<String> choosenAnswer;
  final void Function() onRestart;
  List<Map<String, Object>> getsummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'choosen_answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getsummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] ==
          data['choosen_answer']; // Corrected comparison key
    }).length;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You Answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
                icon: const Icon(Icons.restart_alt_rounded),
                onPressed: onRestart,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                label: const Text(
                  "Restart Quiz!!",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
