import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_list.dart';
import 'package:quiz_app/start_screen.dart';

class ShowResults extends StatefulWidget {
  ShowResults({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  @override
  State<ShowResults> createState() => _ShowResultsState();
}

class _ShowResultsState extends State<ShowResults> {
  //
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add({
        'questionNumber': (i + 1).toString(),
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': widget.chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> summaryData = getSummaryData();

    final numQuestionsCorrect = summaryData.where((data) {
      return data['userAnswer'] == data['correctAnswer'];
    }).length;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              widget.chosenAnswers.clear();
              // print(widget.chosenAnswers);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StartScreen()));
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            width: double.infinity,
            // color: Colors.amber,
            child: Center(
              child: Column(
                children: [
                  Text(
                      'You have answered $numQuestionsCorrect out of  ${questions.length} questions correctly!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.acme(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: const Color.fromARGB(255, 191, 156, 252),
                          height: 1.5)),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    // height: 400,
                    child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.chosenAnswers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ResultsList(
                            myAnswer: widget.chosenAnswers[index],
                            correctAnswer:
                                summaryData[index]['correctAnswer'] as String,
                            theQuestion:
                                summaryData[index]['question'] as String,
                            questionNumber:
                                summaryData[index]['questionNumber'] as String,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
