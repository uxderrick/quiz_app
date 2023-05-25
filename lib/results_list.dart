import 'package:flutter/material.dart';
import 'data/questions.dart';

class ResultsList extends StatefulWidget {
  const ResultsList({
    super.key,
    required this.myAnswer,
    required this.correctAnswer,
    required this.theQuestion,
    required this.questionNumber,
  });

  final String myAnswer;
  final String correctAnswer;
  final String theQuestion;
  final String questionNumber;

  @override
  State<ResultsList> createState() => _ResultsListState();
}

class _ResultsListState extends State<ResultsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: widget.correctAnswer == widget.myAnswer
                    ? Colors.green
                    : Colors.red,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                widget.questionNumber,
                style: TextStyle(
                  color: widget.correctAnswer == widget.myAnswer
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(widget.theQuestion,
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                          height: 1.3)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(widget.correctAnswer,
                    softWrap: true,
                    style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.amber,
                        height: 1.3)),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 300,
                  child: Text(widget.myAnswer,
                      softWrap: true,
                      style: const TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.lightBlueAccent,
                          height: 1.3)),
                ),
                const SizedBox(
                  height: 32,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
