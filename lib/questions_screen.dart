import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'data/questions.dart';
import 'show_results.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(
      () {
        selectedAnswers.add(answer);
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowResults(
                        chosenAnswers: selectedAnswers,
                      )));
        }
      },
    );
    debugPrint(selectedAnswers.toString());
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                  height: 1.5),
            ),
            const SizedBox(
              height: 32,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
