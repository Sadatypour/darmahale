import 'dart:core';

class CourseFetchInputModel {
  int? pageNumber;
  int? itemsInPage;
  int? categoryId;
  int? price;
  int? userId;
  CourseFetchInputModel(
      {this.pageNumber, this.itemsInPage, this.categoryId, this.price,this.userId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PageNumber'] = pageNumber;
    data['ItemsInPage'] = itemsInPage;
    data['categoryId'] = categoryId;
    data['price'] = price;
    data['userId'] = userId;;
    return data;
  }
}
