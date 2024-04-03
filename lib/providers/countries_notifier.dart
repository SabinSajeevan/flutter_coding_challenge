import 'package:flutter_coding_challenge/helpers/services/api/api_repository.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_response_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryNotifier extends StateNotifier<ResponseState> {
  final ApiRepository _apiRepository;

  CountryNotifier(this._apiRepository)
      : super(ResponseState(isLoading: false, isError: false));

  String selectedCountry = '';
  String selectedState = '';

  Future<void> getCountries({bool init = true}) async {
    try {
      if (init) state = state.copyWith(isLoading: true);
      final signIn = await _apiRepository.fetchCountries();
      state =
          state.copyWith(response: signIn, isLoading: false, isError: false);
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString(), isLoading: false, isError: true);
    }
  }

  setSelectedCountry(String? country) {
    selectedCountry = country!;
  }

  setSelectedState(String state) {
    selectedState = state;
  }
}
