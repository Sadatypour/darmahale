// To parse this JSON data, do
//
//     final filterInputModel = filterInputModelFromJson(jsonString);

import 'package:get/state_manager.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

FilterInputModel filterInputModelFromJson(String str) =>
    FilterInputModel.fromJson(json.decode(str));

String filterInputModelToJson(FilterInputModel data) =>
    json.encode(data.toJson());

class FilterInputModel {
  FilterInputModel({
    required this.filterInput,
  });

  final FilterInput filterInput;

  factory FilterInputModel.fromJson(Map<String, dynamic> json) =>
      FilterInputModel(
        filterInput: FilterInput.fromJson(json["filterInput"]),
      );

  Map<String, dynamic> toJson() => {
        "filterInput": filterInput.toJson(),
      };
}

class FilterInput {
  FilterInput(
      {required this.catId,
      required this.title,
      required this.lat,
      required this.lon,
      required this.isUrgent,
      required this.isImage,
      required this.citiesId,
      required this.parishesId,
      required this.advBuyerType,
      required this.specs,
      this.catTitle});

  int? catId;
  String? title;
  String? catTitle;
  int? lat;
  int? lon;
  int? advBuyerType;
  bool? isUrgent;
  bool? isImage;
  List<int> citiesId;
  List<int> parishesId;
  List<FilterSpec> specs;

  factory FilterInput.fromJson(Map<String, dynamic> json) => FilterInput(
        catId: json["catId"],
        title: json["title"],
        lat: json["lat"],
        lon: json["lon"],
        parishesId: json["parishesId"],
        isUrgent: json["isUrgent"],
        advBuyerType: json["advBuyerType"],
        isImage: json["isImage"],
        citiesId: List<int>.from(json["citiesId"].map((x) => x)),
        specs: List<FilterSpec>.from(
            json["specs"].map((x) => FilterSpec.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "title": title,
        "lat": lat,
        "lon": lon,
        "isUrgent": isUrgent,
        "isImage": isImage,
        "advBuyerType": advBuyerType,
        "citiesId": List<dynamic>.from(citiesId.map((x) => x)),
        "specs": List<dynamic>.from(specs.map((x) => x.toJson())),
      };
}

class FilterSpec {
  FilterSpec({
    required this.specId,
    this.itemId,
    this.value,
    this.valueFrom,
    this.valueTo,
  });

  int specId;
  int? itemId;
  int? value;
  int? valueFrom;
  int? valueTo;

  factory FilterSpec.fromJson(Map<String, dynamic> json) => FilterSpec(
        specId: json["specId"],
        itemId: json["itemId"],
        value: json["value"],
        valueFrom: json["valueFrom"],
        valueTo: json["valueTo"],
      );

  Map<String, dynamic> toJson() => {
        "specId": specId,
        "itemId": itemId,
        "value": value,
        "valueFrom": valueFrom,
        "valueTo": valueTo,
      };
}
