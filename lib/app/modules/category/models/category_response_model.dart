class CategoryResponseModel {
  int? xCategoryIdPk;
  int? xParentIdFk;
  String? xCatTitle;
  String? xCatDescription;
  String? xImage;
  String? xIcone;
  bool? xIsActive;
  int? xChildrenCount;
  List<CatSpecs>? catSpecs;

  CategoryResponseModel(
      {this.xCategoryIdPk,
      this.xParentIdFk,
      this.xCatTitle,
      this.xCatDescription,
      this.xImage,
      this.xIcone,
      this.xIsActive,
      this.xChildrenCount,
      this.catSpecs});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    xCategoryIdPk = json['xCategoryIdPk'];
    xParentIdFk = json['xParentIdFk'];
    xCatTitle = json['xCatTitle'];
    xCatDescription = json['xCatDescription'];
    xImage = json['xImage'];
    xIcone = json['xIcone'];
    xIsActive = json['xIsActive'];
    xChildrenCount = json['xChildrenCount'];
    if (json['catSpecs'] != null) {
      catSpecs = <CatSpecs>[];
      json['catSpecs'].forEach((v) {
        catSpecs!.add(new CatSpecs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xCategoryIdPk'] = this.xCategoryIdPk;
    data['xParentIdFk'] = this.xParentIdFk;
    data['xCatTitle'] = this.xCatTitle;
    data['xCatDescription'] = this.xCatDescription;
    data['xImage'] = this.xImage;
    data['xIcone'] = this.xIcone;
    data['xIsActive'] = this.xIsActive;
    data['xChildrenCount'] = this.xChildrenCount;
    if (this.catSpecs != null) {
      data['catSpecs'] = this.catSpecs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CatSpecs {
  int? xCatSpecIdPk;
  int? xCategoryIdFk;
  int? xSpecificationIdFk;
  int? xSpecificationTypeIdFk;
  int? xCatSpecOrder;
  bool? xIsMandatory;
  bool? xIsActive;
  bool? xIsFilter;

  CatSpecs(
      {this.xCatSpecIdPk,
      this.xCategoryIdFk,
      this.xSpecificationIdFk,
      this.xSpecificationTypeIdFk,
      this.xCatSpecOrder,
      this.xIsMandatory,
      this.xIsActive,
      this.xIsFilter});

  CatSpecs.fromJson(Map<String, dynamic> json) {
    xCatSpecIdPk = json['xCatSpecIdPk'];
    xCategoryIdFk = json['xCategoryIdFk'];
    xSpecificationIdFk = json['xSpecificationIdFk'];
    xSpecificationTypeIdFk = json['xSpecificationTypeIdFk'];
    xCatSpecOrder = json['xCatSpecOrder'];
    xIsMandatory = json['xIsMandatory'];
    xIsActive = json['xIsActive'];
    xIsFilter = json['xIsFilter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xCatSpecIdPk'] = this.xCatSpecIdPk;
    data['xCategoryIdFk'] = this.xCategoryIdFk;
    data['xSpecificationIdFk'] = this.xSpecificationIdFk;
    data['xSpecificationTypeIdFk'] = this.xSpecificationTypeIdFk;
    data['xCatSpecOrder'] = this.xCatSpecOrder;
    data['xIsMandatory'] = this.xIsMandatory;
    data['xIsActive'] = this.xIsActive;
    data['xIsFilter'] = this.xIsFilter;
    return data;
  }
}
