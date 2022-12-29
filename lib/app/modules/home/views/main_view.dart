import 'package:dar_mahaleh/app/data/post_model.dart';
import 'package:dar_mahaleh/app/modules/user/views/user_view.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/theme_controller.dart';
import '../../../data/User_details_model.dart';
import '../../../data/custom_color.dart';
import '../../../data/image_title.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TextEditingController txtSearch = TextEditingController();
  List<PostModel> data = [];
  @override
  Widget build(BuildContext context) {
    data = [
      PostModel(
        id: 1,
        userId: 1,
        summary:
            'یکی از بهترین فست فودها ، برای کسانی که می خواهند بهترین فست فود تهران را بخورند ...',
        imageUrl:
            'https://files.namnak.com/users/nh/aup/202106/215_pics/%D8%B7%D8%B1%D8%B2-%D8%AA%D9%87%DB%8C%D9%87-%D8%B3%D8%B3-%D8%A8%D8%B4%D8%A7%D9%85%D9%84.jpg',
        title: 'مرغ سوخاری',
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&usqp=CAU",
        userName: 'علیرضا کیانی مقدم',
      ),
      PostModel(
          id: 1,
          userId: 2,
          summary: 'ترشی مخلوط با بهترین موارد اولیه قیمت مناسب',
          imageUrl:
              'https://files.namnak.com/users/se/aup/202010/77_pics/%D8%AA%D8%B1%D8%B4%DB%8C-%D9%85%D8%AE%D9%84%D9%88%D8%B7.jpg',
          title: 'ترشی ',
          userImage:
              'https://media.nngroup.com/media/people/photos/2022-portrait-page-3.jpg.600x600_q75_autocrop_crop-smart_upscale.jpg',
          userName: 'وحید ضیایی')
    ];
    return Scaffold(
      backgroundColor: CustomColor.greyBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 1 / 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColor.backgroundGreen,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: Get.width * 90 / 100,
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!,
                            textAlign: TextAlign.center,
                            controller: txtSearch,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                hintText: 'جستجو',
                                hintStyle: ThemeController.factory.themeData
                                    .value.textTheme.bodyText1!,
                                labelStyle: ThemeController.factory.themeData
                                    .value.textTheme.bodyText1!,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                fillColor: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 450,
                // width: Get.width,
                child: PostSection(
                    title: 'آخرین پست ها',
                    userImageClicked: (int userId) {
                      UserDetailsModel userDetailsModel = UserDetailsModel(
                          coverImageUrls: [
                            'https://assets-global.website-files.com/6019e43dcfad3c059841794a/62d6de37454aa5754ad51ba5_home%20page%20image.jpg',
                            'https://www.telefonica.com/en/wp-content/uploads/sites/5/2021/12/pexels-kostiantyn-stupak-599982.jpg?resize=1224,673',
                          ],
                          starCount: 5,
                          parish: 'لویزان',
                          userId: 1,
                          description: '''
در فرهنگ رایانه، کاربر (به انگلیسی: User) کسی است که با یک سیستم - اعم از سخت‌افزار یا نرم‌افزار تعامل دارد و از آن استفاده می‌کند. در بیشتر مواقع، کاربر انسان است.[۱] واژهٔ کاربر، استعاره‌ای است که بین افرادی که در پیاده‌سازی سیستم مشارکت داشته‌اند (مانند برنامه‌نویسان)، و استفاده‌کنندگان واقعی از آن (مانند اپراتورها)، تمایز ایجاد می‌کند. گاهی برای تأکید، از اصطلاحاتی مانند کاربر نهایی (End-user) یا کاربر نابرنامه‌ساز (Non-programmer User) هم استفاده می‌شود. هر سیستم می‌تواند یک یا چند نوع کاربر داشته باشد؛ برای نمونه، در ویکی‌پدیای فارسی، چندین نوع کاربر وجود دارد، از جمله: مدیران، مشارکت‌کنندگان، و بازدیدکنندگان

''',
                          userImage:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&usqp=CAU',
                          userName: 'علیرضا کیانی مقدم');
                      Get.to(UserView(userDetailsModel: userDetailsModel));
                    },
                    backgroundColor: CustomColor.greyBackground,
                    data: data,
                    itemClicked: (int) {},
                    showMoreClicked: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
