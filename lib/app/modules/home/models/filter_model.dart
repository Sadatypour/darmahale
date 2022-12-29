// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FilterModel filterModelFromJson(String str) =>
    FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  FilterModel({
    required this.filters,
  });

  final List<Filter> filters;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        filters:
            List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
      };
}

class Filter {
  Filter({
    required this.xCatSpecOrder,
    required this.specType,
    required this.spec,
  });

  final int xCatSpecOrder;
  final SpecType specType;
  final Spec spec;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        xCatSpecOrder: json["xCatSpecOrder"],
        specType: SpecType.fromJson(json["specType"]),
        spec: Spec.fromJson(json["spec"]),
      );

  Map<String, dynamic> toJson() => {
        "xCatSpecOrder": xCatSpecOrder,
        "specType": specType.toJson(),
        "spec": spec.toJson(),
      };
}

class Spec {
  Spec({
    required this.xSpecificationIdPk,
    required this.xSpecTitle,
    required this.xIsScalar,
    required this.xIsBool,
    required this.xIsMultiselectFliter,
    required this.unit,
    required this.items,
  });

  final int xSpecificationIdPk;
  final String xSpecTitle;
  final bool xIsScalar;
  final bool xIsBool;
  final bool xIsMultiselectFliter;
  final Unit unit;
  final List<Item> items;

  factory Spec.fromJson(Map<String, dynamic> json) => Spec(
        xSpecificationIdPk: json["xSpecificationIdPk"],
        xSpecTitle: json["xSpecTitle"],
        xIsScalar: json["xIsScalar"],
        xIsBool: json["xIsBool"],
        xIsMultiselectFliter: json["xIsMultiselectFliter"],
        unit: Unit.fromJson(json["unit"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "xSpecificationIdPk": xSpecificationIdPk,
        "xSpecTitle": xSpecTitle,
        "xIsScalar": xIsScalar,
        "xIsBool": xIsBool,
        "xIsMultiselectFliter": xIsMultiselectFliter,
        "unit": unit.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.xSpecificationItemIdPk,
    required this.xItem,
    required this.xItemValue,
  });

  final int xSpecificationItemIdPk;
  final String xItem;
  final int xItemValue;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        xSpecificationItemIdPk: json["xSpecificationItemIdPk"],
        xItem: json["xItem"],
        xItemValue: json["xItemValue"],
      );

  Map<String, dynamic> toJson() => {
        "xSpecificationItemIdPk": xSpecificationItemIdPk,
        "xItem": xItem,
        "xItemValue": xItemValue,
      };
}

class Unit {
  Unit({
    required this.xUnitIdPk,
    required this.xUnitTitle,
  });

  final int xUnitIdPk;
  final String xUnitTitle;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        xUnitIdPk: json["xUnitIdPk"],
        xUnitTitle: json["xUnitTitle"],
      );

  Map<String, dynamic> toJson() => {
        "xUnitIdPk": xUnitIdPk,
        "xUnitTitle": xUnitTitle,
      };
}

class SpecType {
  SpecType({
    required this.xSpecTypeIdPk,
    required this.xSpecTypeTitle,
    required this.xSpecTypeOrder,
  });

  final int xSpecTypeIdPk;
  final String xSpecTypeTitle;
  final int xSpecTypeOrder;

  factory SpecType.fromJson(Map<String, dynamic> json) => SpecType(
        xSpecTypeIdPk: json["xSpecTypeIdPk"],
        xSpecTypeTitle: json["xSpecTypeTitle"],
        xSpecTypeOrder: json["xSpecTypeOrder"],
      );

  Map<String, dynamic> toJson() => {
        "xSpecTypeIdPk": xSpecTypeIdPk,
        "xSpecTypeTitle": xSpecTypeTitle,
        "xSpecTypeOrder": xSpecTypeOrder,
      };
}
