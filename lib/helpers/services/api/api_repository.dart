import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_coding_challenge/constants/api_path.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_services.dart';
import 'package:flutter_coding_challenge/models/values_model.dart';

class ApiRepository {
  Future<ValuesModel> fetchCountries() async {
    RestAPIService restAPIService = RestAPIService(Dio());
    var result = await restAPIService.getService(
      url: CodingChallengeAPI.countriesUrl,
    );

    return compute(valuesModelFromJson, result);
  }

  Future<ValuesModel> fetchStates(url) async {
    RestAPIService restAPIService = RestAPIService(Dio());
    var result = await restAPIService.getService(
      url: url,
    );

    return compute(valuesModelFromJson, result);
  }
}
