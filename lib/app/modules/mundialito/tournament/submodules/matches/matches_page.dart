import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/matches/matches_view_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/shared/widgets/liststate/empty_state_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/shared/widgets/matchlist/matches_list_widget.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key, required this.mundialitoId}) : super(key: key);

  final String mundialitoId;

  @override
  MatchesPageState createState() => MatchesPageState();
}

class MatchesPageState extends State<MatchesPage> {
  final MatchesViewModel viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    viewModel.getMundialitoMatches(widget.mundialitoId);
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Observer(builder: (_) {
        if (viewModel.isLoading) {
          return const PrimaryLoaderWidget();
        } else if (viewModel.mundialitoMatches?.matches.isEmpty == true) {
          return const EmptyStateWidget(message: "For some reason the matches were not created, please try to create your mundialito again.",);
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Upcoming matches",
                  style: textTheme.headline1?.copyWith(),
                ),
                const SizedBox(height: 16),
                MatchesListWidget(matches: viewModel.mundialitoMatches?.matches ?? <Match>[])
              ],
            ),
          );
        }
      }),
    );
  }
}
