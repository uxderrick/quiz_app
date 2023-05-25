import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/results_list.dart';

class ShowResults extends StatefulWidget {
  const ShowResults({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  @override
  State<ShowResults> createState() => _ShowResultsState();
}

class _ShowResultsState extends State<ShowResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(Icons.refresh),
          SizedBox(
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
                  Text('You have answered 3 out of 6 questions correctly!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.acme(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: const Color.fromARGB(255, 191, 156, 252),
                          height: 1.5)),
                  const SizedBox(
                    height: 40,
                  ),
                  ResultsList(
                    someList: widget.chosenAnswers[0].toString(),
                  ),
                  // ResultsList(),
                  // ResultsList(),
                  // ResultsList(),
                  // ResultsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
