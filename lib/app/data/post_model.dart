class PostModel {
  int id;
  int userId;
  String imageUrl;
  String title;
  String userName;
  String userImage;
  String summary;
  PostModel(
      {required this.id,
      required this.userId,
      required this.imageUrl,
      required this.summary,
      required this.title,
      required this.userImage,
      required this.userName});
}
