import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/tournament_view_model.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key? key}) : super(key: key);

  @override
  TournamentPageState createState() => TournamentPageState();
}

class TournamentPageState extends State<TournamentPage> {
  final TournamentViewModel viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Text("Alo"),
    );
  }

}