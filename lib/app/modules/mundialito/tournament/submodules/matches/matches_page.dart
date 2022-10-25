import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key, required this.mundialitoId}) : super(key: key);

  final String mundialitoId;

  @override
  MatchesPageState createState() => MatchesPageState();
}

class MatchesPageState extends State<MatchesPage> {

  @override
  Widget build(BuildContext context) {
    print(widget.mundialitoId);
    return Scaffold(
      body: Text("Matches page!"),
    );
  }

}