import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/models/values_model.dart';

class CommonDropDown extends StatelessWidget {
  const CommonDropDown(
      {super.key,
      required this.type,
      required this.list,
      required this.onValueChanged,
      required this.isCountrySelected});
  final String type;
  final List<Values> list;
  final Function(Values values) onValueChanged;
  final bool isCountrySelected;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<Values>.search(
      hintText: 'Select ${type == "country" ? "Country" : "State"}',
      items: list,
      headerBuilder: (context, selectedItem) {
        return Row(children: [
          Icon(
            type == "country" ? CupertinoIcons.globe : CupertinoIcons.location,
            grade: 0.1,
            weight: 0.1,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            type == "state" && isCountrySelected
                ? "Select State"
                : selectedItem.value!,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ]);
      },
      hideSelectedFieldWhenExpanded: true,
      hintBuilder: (context, hint) {
        return Row(children: [
          Icon(
            type == "country" ? CupertinoIcons.globe : CupertinoIcons.location,
            grade: 0.1,
            weight: 0.1,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            hint,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ]);
      },
      decoration: CustomDropdownDecoration(
        closedBorder: Border.all(color: Colors.grey.shade400),
        closedShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(1, 1),
              spreadRadius: 2)
        ],
        closedSuffixIcon: const Icon(
          CupertinoIcons.chevron_down,
          size: 22,
        ),
        closedBorderRadius: const BorderRadius.all(Radius.circular(10)),
        expandedSuffixIcon: const Icon(
          CupertinoIcons.chevron_up,
          size: 22,
        ),
        listItemDecoration: ListItemDecoration(
            selectedColor: Colors.lightBlue.withOpacity(0.2)),
        expandedShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(1, 1),
              spreadRadius: 2)
        ],
        expandedBorder: Border.all(color: Colors.grey.shade400),
      ),
      listItemBuilder: (context, item, isSelected, onItemSelect) {
        return Text(
          item.value!,
          style: Theme.of(context).textTheme.bodyLarge,
        );
      },
      excludeSelected: false,
      onChanged: (value) {
        onValueChanged(value);
      },
    );
  }
}
