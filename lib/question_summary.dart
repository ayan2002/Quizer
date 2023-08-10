import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizer/question_index.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summarydata, {Key? key}) : super(key: key);

  final List<Map<String, Object?>> summarydata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map(
            (data) {
              // Get the question text from the data map
              int questionIndex = (data['question_index'] as int);
              bool isCorrectAnswer =
                  data['choosen_answer'] == data['correct_answer'];

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionIdentifier(
                    isCorrectAnswer: isCorrectAnswer,
                    questionIndex: questionIndex,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String? ??
                              'No question available',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        // Display the chosen answer using the choosenAnswer list
                        Text(
                          ((data['choosen_answer'] as String?) ??
                              'Chosen answer not available'),
                          style: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),

                        // Display the correct answer (handle null case)
                        Text(
                          (data['correct_answer'] as String?) ??
                              'Correct answer not available',
                          style: GoogleFonts.lato(
                            color: Colors.blueAccent,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
