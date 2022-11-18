import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/tournament_view_model.dart';
import 'package:mundialito/app/shared/widgets/snackbar/snackbar_widget.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key? key, required this.mundialitoId}) : super(key: key);

  final String mundialitoId;

  @override
  TournamentPageState createState() => TournamentPageState();
}

class TournamentPageState extends State<TournamentPage> {
  final TournamentViewModel _viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    _viewModel.setInitialRoute(widget.mundialitoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: _onExitMundialitoPressed,
            icon: const Icon(Icons.close)
        ),
        actions: [
          IconButton(
              onPressed: _copyCode,
              icon: const Icon(Icons.share)
          ),
          PopupMenuButton(
              onSelected: _handleOptionMenuClick,
              itemBuilder: (BuildContext context) {
                return {'Finish', 'Cancel'}.map((option) {
                  return PopupMenuItem(value: option, child: Text(option));
                }).toList();
              }),
        ],
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _viewModel.currentIndex = index;
            });
            if (index == 0) {
              Modular.to.pushNamed('/tournament/results/${widget.mundialitoId}');
            } else if (index == 1) {
              Modular.to.pushNamed('/tournament/overview/${widget.mundialitoId}');
            } else if (index == 2) {
              Modular.to.pushNamed('/tournament/matches/${widget.mundialitoId}');
            } else if (index == _viewModel.currentIndex) {
              Modular.to.pushNamed('/tournament/overview/${widget.mundialitoId}');
            }
          },
          currentIndex: _viewModel.currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.event_repeat), label: 'Results'),
            BottomNavigationBarItem(icon: Icon(Icons.dataset), label: 'Overview'),
            BottomNavigationBarItem(icon: Icon(Icons.event_available), label: 'Matches'),
          ],
        );
      }),
    );
  }

  void _onEndedMundialitoPressed() {
    Modular.to.pushNamed('/tournament/endedresult/${widget.mundialitoId}');
  }

  void _handleOptionMenuClick(String option) {
    switch (option) {
      case 'Finish':
        _onFinishMundialitoPressed();
        break;
      case 'Cancel':
        _onCancelMundialitoPressed();
        break;
      case 'Exit':
        _onExitMundialitoPressed();
        break;
    }
  }

  Future<void> _onFinishMundialitoPressed() async {
    await _viewModel.finishMundialito(widget.mundialitoId);
    Modular.to.pushNamed("/home");
  }

  Future<void> _onCancelMundialitoPressed() async {
    await _viewModel.cancelMundialito(widget.mundialitoId);
    Modular.to.pushNamed("/home");
  }

  Future<void> _onExitMundialitoPressed() async {
    Modular.to.popAndPushNamed("/home");
  }

  Future<void> _copyCode() async {
    Clipboard.setData(ClipboardData(text: _viewModel.tournament?.joinCode ?? ""))
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
        makeSuccessSnackBar("The code was successfully copied to your clipboard!")));
  }

}