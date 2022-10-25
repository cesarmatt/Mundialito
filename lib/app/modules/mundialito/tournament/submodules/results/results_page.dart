import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key, required this.mundialitoId}) : super(key: key);

  final String mundialitoId;

  @override
  ResultsPageState createState() => ResultsPageState();
}

class ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.mundialitoId);
    return Scaffold(
      body: Text("Results page!"),
    );
  }

}