import 'dart:core';

class FetchInputModel {
  int? pageNumber;
  int? itemsInPage;
  int? categoryId;
  int? episodeType;
  int? courseId;
  bool? courseNotNull;
  int? price;
  int? userId;
  bool? bookmark;
  bool? like;
  FetchInputModel(
      {this.pageNumber,
      this.itemsInPage,
      this.categoryId,
      this.episodeType,
      this.courseId,
      this.courseNotNull,
      this.price,
      this.userId,this.bookmark,this.like
      
      });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PageNumber'] = this.pageNumber;
    data['ItemsInPage'] = this.itemsInPage;
    data['categoryId'] = this.categoryId;
    data['episodeType'] = this.episodeType;
    data['courseId'] = this.courseId;
    data['courseNotNull'] = this.courseNotNull;
    data['price'] = this.price;
    data['userId'] = this.userId;
     data['bookmark'] = this.bookmark;
       data['like'] = this.like;
    return data;
  }
}
