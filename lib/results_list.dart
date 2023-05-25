import 'package:flutter/material.dart';

class ResultsList extends StatefulWidget {
  const ResultsList({
    super.key,
    required this.someList,
  });

  final String someList;

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
                  color: Colors.amber, borderRadius: BorderRadius.circular(40)),
              child: const Text('1'),
            ),
            const SizedBox(
              width: 16,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                      'This will be the question. It can bfdfd fdfdfdfe long',
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                          height: 1.3)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Correct Answer',
                    softWrap: true,
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.pinkAccent,
                        height: 1.3)),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 300,
                  child: Text('Your Answer',
                      softWrap: true,
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.lightBlueAccent,
                          height: 1.3)),
                ),
                SizedBox(
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
