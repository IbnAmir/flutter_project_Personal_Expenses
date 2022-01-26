import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'YOU ARE FUCKIN IDIOT!!!';
    if (resultScore <= 15) {
      resultText = 'YOU ARE FUCKIN IDIOT!!! and a big asshole nigga';
    } else if (resultScore <= 20) {
      resultText = 'Baby king';
    } else {
      resultText = 'KING';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart the Quiz'))
        ],
      ),
    );
  }
}
