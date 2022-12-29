class UserDetailsModel {
  int userId;
  int starCount;
  List<String> coverImageUrls;
  String userName;
  String userImage;
  String description;
  String parish;
  UserDetailsModel(
      {required this.userId,
      required this.starCount,
      required this.parish,
      required this.coverImageUrls,
      required this.description,
      required this.userImage,
      required this.userName});
}
