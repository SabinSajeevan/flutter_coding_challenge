import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/constants/api_path.dart';
import 'package:flutter_coding_challenge/helpers/comon_helpers.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_providers.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_response_state.dart';
import 'package:flutter_coding_challenge/models/values_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  List<Values> countriesList = [Values(id: 0, value: "Select")];
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
        // showMessage(context, next.response['message'], type: "success");
        Navigator.pop(context);
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
                child: Icon(
              CupertinoIcons.placemark,
              color: Colors.black87.withOpacity(0.7),
              size: 70,
            )),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Select your location",
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
            CustomDropdown<Values>.search(
              hintText: 'Select Country',
              items: countriesList,
              headerBuilder: (context, selectedItem) {
                return Text(selectedItem.value!);
              },
              decoration: CustomDropdownDecoration(
                  closedBorder: Border.all(color: Colors.black87),
                  closedBorderRadius:
                      const BorderRadius.all(Radius.circular(15))),
              listItemBuilder: (context, item, isSelected, onItemSelect) {
                return Text(item.value!);
              },
              excludeSelected: false,
              onChanged: (value) {
                showLog('changing value to: $value');
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
