import 'package:dar_mahaleh/app/controllers/theme_controller.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/app/modules/add_product/views/add_product_view.dart';
import 'package:dar_mahaleh/app/modules/map/views/map_view.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.greyBackground,
        body: SafeArea(
            child: Container(
          // padding: EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 1 / 3,
                  decoration: BoxDecoration(color: CustomColor.backgroundGreen),
                ),
                Positioned(
                  top: 20,
                  right: 40,
                  child: Row(
                    children: [
                      UserAvatar(
                        userImageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&usqp=CAU',
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeader2(
                            text: 'علیرضاکیانی مقدم',
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextBody(
                            text: 'پروفایل شما',
                            color: Color.fromARGB(255, 235, 233, 233),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 90),
                        width: MediaQuery.of(context).size.width * 4.5 / 5,
                        // height: Get.height * 1 / 3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.home),
                              title: TextHeader2(text: 'خانه'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: TextHeader2(text: 'ویرایش پروفایل'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(MapView());
                              },
                              child: ListTile(
                                leading: Icon(Icons.location_on),
                                title: TextHeader2(text: 'نقشه'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(CupertinoIcons.heart_fill),
                              title: TextHeader2(text: 'وقایع'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(Icons.pages),
                              title: TextHeader2(text: 'پیشنهادات و انتقادات'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(CupertinoIcons.money_dollar),
                              title: TextHeader2(text: 'شارژ ماهیانه'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25, bottom: 25),
                        width: MediaQuery.of(context).size.width * 4.5 / 5,
                        // height: Get.height * 1 / 3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.store),
                              title: TextHeader2(text: 'خرید و فروش کالا'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(Icons.bookmark),
                              title: TextHeader2(text: 'گمشده و پیدا شده'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(Icons.warning),
                              title: TextHeader2(text: 'نگرانی های هم محله ای'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(
                                  CupertinoIcons.list_bullet_below_rectangle),
                              title: TextHeader2(text: 'دوره های آموزشی'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(Icons.message),
                              title: TextHeader2(text: 'پیام ها'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(Icons.logout),
                              title: TextHeader2(text: 'خروج از حساب'),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              height: 0.2,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     Get.to(AddProductView());
                //   },
                //   child: ListTile(
                //     leading: Icon(Icons.add),
                //     title: TextHeader2(text: 'افزودن محصول'),
                //   ),
                // ),
              ],
            ),
          ),
        )));
  }
}
