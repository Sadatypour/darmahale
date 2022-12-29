import 'package:dar_mahaleh/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../../../../tools/custom_widgets.dart';
import '../../../data/custom_color.dart';
import '../../home/views/home_view.dart';
import '../controllers/category_controller.dart';

class CategoryView extends StatefulWidget {
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryController controller = CategoryController.factory;
  @override
  void initState() {
    //controller.categories.clear();
    fetchCategories();
    super.initState();
  }

  void fetchCategories({int? parentId, bool deleteParentFromHistory = false}) {
    try {
      EasyLoading.show(dismissOnTap: true);
      controller.getCategories(parent: parentId).then((value) {
        EasyLoading.dismiss();
        if (deleteParentFromHistory == true) {
          controller.backParentIds.remove(parentId);
        }
      }).onError((error, stackTrace) {
        EasyLoading.dismiss();
      });
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showInfo(
          'در گرفتن داده خطایی رخ داده است ، لطفا از اتصال خود به اینترنت اطمینان حاصل کرده و مجدد تلاش نمایید .');
      Future.delayed(
          Duration(
            seconds: 1,
          ), () {
        Get.back();
      });
    }
  }

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
                  top: 40,
                  right: 40,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 4.5 / 5 - 30,
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.list,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextHeader(
                              text: 'دسته بندی پست ها',
                              color: Colors.white,
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 50,
                        // ),
                        Obx(() {
                          if (controller.backParentIds.isEmpty) {
                            return Container();
                          }
                          return InkWell(
                            onTap: () {
                              if (controller.backParentIds.isNotEmpty) {
                                // int? parentId = controller.backParentIds.last;
                                // fetchCategories(
                                //     parentId: parentId,
                                //     deleteParentFromHistory: true);
                                controller.backCategoryList();
                              }
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 25,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 90),
                          width: MediaQuery.of(context).size.width * 4.5 / 5,
                          // height: Get.height * 1 / 3,
                          constraints:
                              BoxConstraints(minHeight: Get.height * 1 / 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(() {
                            if (controller.categories.isEmpty) {
                              return Container();
                            }
                            return Column(
                              children: [
                                ...controller.categories.map((element) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (element.xChildrenCount != 0) {
                                            fetchCategories(
                                                parentId:
                                                    element.xCategoryIdPk);
                                          } else {
                                            //در صورتی که گروه فرزندی نداشته باشد فیلتر کنترلر صفحه اصلی فعال می شود
                                            HomeController
                                                .factory
                                                .filterInput
                                                .value
                                                .catId = element.xCategoryIdPk;
                                            HomeController
                                                .factory
                                                .filterInput
                                                .value
                                                .catTitle = element.xCatTitle;
                                            HomeController.factory
                                                .filterIsActive.value = true;

                                            bottomSheetcontroller.index = 0;
                                          }
                                        },
                                        child: ListTile(
                                          leading: element.xIcone == null
                                              ? Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.white,
                                                )
                                              : Icon(IconData(
                                                  int.tryParse(
                                                          element.xIcone!) ??
                                                      0xf222,
                                                  fontFamily: 'MaterialIcons')),
                                          title: TextHeader2(
                                              text: element.xCatTitle!),
                                          trailing: element.xChildrenCount == 0
                                              ? Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.white,
                                                )
                                              : Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 15,
                                                ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsetsDirectional.only(
                                            start: 20, end: 20),
                                        height: 0.2,
                                        color: Colors.grey,
                                      )
                                    ],
                                  );
                                })
                              ],
                            );
                          })),
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
