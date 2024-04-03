import 'package:flutter_coding_challenge/helpers/services/api/api_repository.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_response_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatesNotifier extends StateNotifier<ResponseState> {
  final ApiRepository _apiRepository;

  StatesNotifier(this._apiRepository)
      : super(ResponseState(isLoading: false, isError: false));

  Future<void> getStates({bool init = true, required String url}) async {
    try {
      if (init) state = state.copyWith(isLoading: true);
      final signIn = await _apiRepository.fetchStates(url);
      state =
          state.copyWith(response: signIn, isLoading: false, isError: false);
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString(), isLoading: false, isError: true);
    }
  }
}
