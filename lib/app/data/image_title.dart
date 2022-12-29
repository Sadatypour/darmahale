class ImageTitle{
  late String imageUrl;
   late String title;
   late int id;
   int ? courseId;
  ImageTitle( {required this.id,required this.imageUrl,required this.title,this.courseId});
  ImageTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['courseId'] = this.courseId;
    return data;
  }
}