import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/constants/api_path.dart';
import 'package:flutter_coding_challenge/helpers/common_dropdown.dart';
import 'package:flutter_coding_challenge/helpers/comon_helpers.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_providers.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_response_state.dart';
import 'package:flutter_coding_challenge/models/values_model.dart';
import 'package:flutter_coding_challenge/modules/message_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  List<Values> countriesList = [Values(id: 0, value: "Select")];
  List<Values> statesList = [Values(id: 0, value: "Select")];
  String selectedCountry = "Select";
  bool isCountrySelected = false;
  bool isStateSelected = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      getCountries();
    });
    super.initState();
  }

  getCountries() {
    ref.read(countriesNotifierProvider.notifier).getCountries();
  }

  getStates(Values country) {
    String url = CodingChallengeAPI.stateUrl
        .replaceAll("country_id", country.id.toString());
    ref.read(statesNotifierProvider.notifier).getStates(url: url);
  }

  onSubmitPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Message()),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ResponseState>(countriesNotifierProvider,
        (ResponseState? previous, ResponseState next) {
      if (next.isLoading!) {
        showProgress(context);
      } else if (next.isError!) {
        Navigator.pop(context);
        showMessage(context, next.errorMessage!);
      } else {
        setState(() {
          countriesList = next.response.values;
        });
        Navigator.pop(context);
      }
    });
    ref.listen<ResponseState>(statesNotifierProvider,
        (ResponseState? previous, ResponseState next) {
      if (next.isLoading!) {
        showProgress(context);
      } else if (next.isError!) {
        Navigator.pop(context);
        showMessage(context, next.errorMessage!);
      } else {
        setState(() {
          statesList = next.response.values;
        });
        Navigator.pop(context);
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 20),
                child: Center(
                    child: Icon(
                  CupertinoIcons.placemark,
                  color: Colors.black87.withOpacity(0.7),
                  size: 65,
                )),
              ),
              Text(
                "Select Your Location",
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Choose your country and state from the dropdowns below.",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Country",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 3,
              ),
              CommonDropDown(
                  type: "country",
                  list: countriesList,
                  isCountrySelected: isCountrySelected,
                  onValueChanged: (Values value) {
                    if (value.value != selectedCountry) {
                      setState(() {
                        selectedCountry = value.value!;
                        getStates(value);
                        isCountrySelected = true;
                        isStateSelected = false;
                      });
                      ref
                          .read(countriesNotifierProvider.notifier)
                          .setSelectedCountry(value.value!);
                    }
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 3),
                child: Text(
                  "State",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              CommonDropDown(
                  type: "state",
                  isCountrySelected: isCountrySelected,
                  list: statesList,
                  onValueChanged: (Values value) {
                    if (value.value != "Select") {
                      setState(() {
                        isCountrySelected = false;
                        isStateSelected = true;
                      });
                      ref
                          .read(countriesNotifierProvider.notifier)
                          .setSelectedState(value.value!);
                    }
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, top: 0, bottom: 20, right: 20),
        child: ElevatedButton(
          style: ButtonStyle(
              shadowColor:
                  MaterialStateProperty.resolveWith((states) => Colors.grey),
              padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.symmetric(vertical: 14)),
              shape: MaterialStateProperty.resolveWith((states) =>
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => isStateSelected ? Colors.green : Colors.grey)),
          onPressed: isStateSelected
              ? () {
                  onSubmitPressed();
                }
              : null,
          child: const Text(
            "SUBMIT",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
