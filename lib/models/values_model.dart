import 'package:animated_custom_dropdown/custom_dropdown.dart';

ValuesModel valuesModelFromJson(str) {
  return ValuesModel.fromJson(str);
}

class ValuesModel {
  List<Values>? values;

  ValuesModel({this.values});

  ValuesModel.fromJson(List<dynamic>? json) {
    values = <Values>[];
    if (json != null) {
      for (var v in json) {
        values!.add(Values.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values with CustomDropdownListFilter {
  int? id;
  String? value;

  Values({this.id, this.value});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    return data;
  }

  @override
  bool filter(String query) {
    return value!.toLowerCase().contains(query.toLowerCase());
  }
}
