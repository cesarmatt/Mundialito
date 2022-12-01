import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/join/join_mundialito_repository.dart';

part 'join_mundialito_view_model.g.dart';

class JoinMundialitoViewModel = _JoinMundialitoViewModelBase with _$JoinMundialitoViewModel;

abstract class _JoinMundialitoViewModelBase with Store {
  final JoinMundialitoRepository _repository = JoinMundialitoRepository();
  final mundialitoJoinCodeTextEditingController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @action
  Future<void> joinMundialito() async {
    isLoading = true;
    var response = await _repository.joinMundialito(mundialitoJoinCodeTextEditingController.text);
    if (response) {
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }
}