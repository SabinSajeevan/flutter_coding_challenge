import 'package:flutter_coding_challenge/helpers/services/api/api_repository.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_response_state.dart';
import 'package:flutter_coding_challenge/providers/countries_notifier.dart';
import 'package:flutter_coding_challenge/providers/states_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//base API provider
final homeApiRepositoryProvider = Provider<ApiRepository>(
  (ref) => ApiRepository(),
);

final countriesNotifierProvider =
    StateNotifierProvider<CountryNotifier, ResponseState>(
  (ref) => CountryNotifier(ref.watch(homeApiRepositoryProvider)),
);
