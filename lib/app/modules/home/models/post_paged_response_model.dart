class PostPagedResponseModel {
  int? numbeOfAllPages;
  int? currentPageIndex;
  bool? hasMore;
  int? numbeOfAllItems;
  List<PostItem>? items;

  PostPagedResponseModel(
      {this.numbeOfAllPages,
      this.currentPageIndex,
      this.hasMore,
      this.numbeOfAllItems,
      this.items});

  PostPagedResponseModel.fromJson(Map<String, dynamic> json) {
    numbeOfAllPages = json['numbeOfAllPages'];
    currentPageIndex = json['currentPageIndex'];
    hasMore = json['hasMore'];
    numbeOfAllItems = json['numbeOfAllItems'];
    if (json['items'] != null) {
      items = <PostItem>[];
      json['items'].forEach((v) {
        items!.add(new PostItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numbeOfAllPages'] = this.numbeOfAllPages;
    data['currentPageIndex'] = this.currentPageIndex;
    data['hasMore'] = this.hasMore;
    data['numbeOfAllItems'] = this.numbeOfAllItems;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostItem {
  int? id;
  int? userId;
  List<String>? imageUrls;
  String? videoUrl;
  String? title;
  String? userName;
  String? userImage;
  String? summary;

  PostItem(
      {this.id,
      this.userId,
      this.imageUrls,
      this.videoUrl,
      this.title,
      this.userName,
      this.userImage,
      this.summary});

  PostItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    if (json['imageUrls'] != null) {
      imageUrls = json['imageUrls'].cast<String>();
    } else {
      imageUrls = null;
    }
    videoUrl = json['videoUrl'];
    title = json['title'];
    userName = json['userName'];
    userImage = json['userImage'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['imageUrls'] = this.imageUrls;
    data['videoUrl'] = this.videoUrl;
    data['title'] = this.title;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    data['summary'] = this.summary;
    return data;
  }
}
