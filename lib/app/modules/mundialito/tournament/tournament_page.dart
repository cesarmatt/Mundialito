import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/tournament_view_model.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key? key, required this.mundialitoId}) : super(key: key);

  final String mundialitoId;

  @override
  TournamentPageState createState() => TournamentPageState();
}

class TournamentPageState extends State<TournamentPage> {
  final TournamentViewModel viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    print(widget.mundialitoId);
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          onTap: (index) {
            setState(() {
              viewModel.currentIndex = index;
            });
            if (index == 0) {
              Modular.to.pushNamed('/tournament/results/${widget.mundialitoId}');
            } else if (index == 1) {
              Modular.to.pushNamed('/tournament/overview/${widget.mundialitoId}');
            } else if (index == 2) {
              Modular.to.pushNamed('/tournament/matches/${widget.mundialitoId}');
            } else if (index == viewModel.currentIndex) {
              Modular.to.pushNamed('/tournament/overview/${widget.mundialitoId}');
            }
          },
          currentIndex: viewModel.currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.event_repeat), label: 'Results'),
            BottomNavigationBarItem(icon: Icon(Icons.dataset), label: 'Overview'),
            BottomNavigationBarItem(icon: Icon(Icons.event_available), label: 'Matches'),
          ],
        );
      }),
    );
  }

}