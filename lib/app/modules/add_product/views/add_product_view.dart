import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/app/modules/add_product/models/product_type.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../../tools/custom_service.dart';
import '../../../controllers/theme_controller.dart';
import '../../../services/geo_api.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends StatefulWidget {
  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final ImagePicker _picker = ImagePicker();
  AddProductController controller = AddProductController.factory;
  TextEditingController txtProduct = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StreamController<bool> showWaitingBtnController =
      StreamController<bool>.broadcast();
  double? _distanceToField;
  late TextfieldTagsController _tagController;
  @override
  void initState() {
    controller.images.clear();
    _tagController = TextfieldTagsController();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            decoration: BoxDecoration(color: CustomColor.backgroundGreen),
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHeader2(
                    text: 'افزودن محصول جدید',
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: CustomColor.backgroundGreenLight,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(color: CustomColor.backgroundGreen),
              //   height: 80,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         TextHeader2(
              //           text: 'افزودن محصول جدید',
              //           color: Colors.white,
              //         ),
              //         InkWell(
              //           onTap: () {
              //             Get.back();
              //           },
              //           child: CircleAvatar(
              //             radius: 18,
              //             backgroundColor: CustomColor.backgroundGreenLight,
              //             child: Icon(
              //               Icons.arrow_forward,
              //               color: Colors.white,
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(color: CustomColor.greyBackground),
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            //splashColor: CustomColor.backgroundGreen,
                            onTap: () {
                              AwesomeDialog dialog = AwesomeDialog(
                                  context: context,
                                  animType: AnimType.scale,
                                  dialogType: DialogType.info,
                                  body: Center(
                                      child: TextBody(
                                    text:
                                        'انتخاب کنید که تصویر را از گالری اضافه می کنید یا دوربین ؟',
                                  )),
                                  title: 'This is Ignored',
                                  desc: 'This is also Ignored',
                                  btnOkText: 'دوربین',
                                  btnCancelText: 'گالری',
                                  btnOkOnPress: () async {
                                    final XFile? photo = await _picker
                                        .pickImage(source: ImageSource.camera);
                                    if (photo != null) {
                                      controller.images.add(photo);
                                    }
                                  },
                                  btnCancelOnPress: () {});

                              dialog.show();
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              color: Colors.grey,
                              dashPattern: [5, 5],
                              radius: Radius.circular(10),
                              strokeWidth: 1,
                              child: Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                    // color: Colors.red,
                                    ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                    TextBody(
                                      text: 'اضافه کردن',
                                      color: CustomColor.darkerText,
                                    ),
                                    TextBody(text: ' 150 * 100')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //     child: ListView(
                        //   shrinkWrap: true,
                        //   physics: ClampingScrollPhysics(),
                        //   scrollDirection: Axis.horizontal,
                        //   children: [
                        //     Container(
                        //       height: 120,
                        //       width: 100,
                        //     )
                        //   ],
                        // ))

                        Obx(() {
                          if (controller.images.isEmpty) {
                            return Container();
                          }
                          return SizedBox(
                            width: Get.width - 155,
                            height: 120,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin:
                                          EdgeInsets.only(right: 5, top: 10),
                                      // color: Colors.red,
                                      height: 100,
                                      width: 150,
                                      child: Image.file(
                                        File(controller.images[index].path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: InkWell(
                                            onTap: () {
                                              controller.images.removeAt(index);
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: Colors.grey[900],
                                            )))
                                  ],
                                );
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                    TextBody(text: 'فقط می توانید چهار تصویر اضافه کنید')
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Obx(() => DropdownButton(
                        underline: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        isExpanded: true,
                        value: controller.productTypeSelectedId.value,
                        items: controller.productTypes.map((e) {
                          return DropdownMenuItem<int>(
                            value: e.id,
                            child: TextBody(
                              text: e.title,
                            ),
                          );
                        }).toList(),
                        onChanged: (item) {
                          controller.productTypeSelectedId.value = item!;
                        })),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'نام محصول را وارد کنید .';
                          }
                        },
                        style: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!,
                        textAlign: TextAlign.right,
                        controller: txtProduct,
                        decoration: InputDecoration(
                            labelText: 'نام محصول',

                            //hintText: 'نام شما',
                            hintStyle: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!
                                .copyWith(color: Colors.grey),
                            labelStyle: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!,
                            //focusColor: Colors.white,
                            //filled: true,

                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),

                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            fillColor: CustomColor.backgroundGreen)),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        style: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!,
                        textAlign: TextAlign.right,
                        controller: txtCategory,
                        decoration: InputDecoration(
                            labelText: 'دسته بندی محصول',
                            //hintText: 'نام شما',
                            hintStyle: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!
                                .copyWith(color: Colors.grey),
                            labelStyle: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!,
                            //focusColor: Colors.white,
                            //filled: true,

                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),

                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            fillColor: CustomColor.backgroundGreen)),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        style: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!,
                        textAlign: TextAlign.right,
                        controller: txtPrice,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'قیمت محصول را وارد کنید .';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'قیمت محصول (تومان)',
                            //hintText: 'نام شما',
                            hintStyle: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!
                                .copyWith(color: Colors.grey),
                            labelStyle: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!,
                            //focusColor: Colors.white,
                            //filled: true,

                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),

                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            fillColor: CustomColor.backgroundGreen)),
                    TextFormField(
                        maxLength: 300,
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value!.isEmpty) {
                            return ' آدرس را وارد کنید .';
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!,
                        textAlign: TextAlign.right,
                        controller: txtAddress,
                        decoration: InputDecoration(
                            labelText: 'آدرس صاحب محصول',
                            //hintText: 'نام شما',
                            hintStyle: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!
                                .copyWith(color: Colors.grey),
                            labelStyle: ThemeController
                                .factory.themeData.value.textTheme.bodyText1!,
                            //focusColor: Colors.white,
                            //filled: true,

                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),

                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              //borderRadius: BorderRadius.circular(25.7),
                            ),
                            fillColor: CustomColor.backgroundGreen)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_searching,
                          color: Colors.blueAccent,
                        ),
                        TextButton(
                          child: TextHeader2(
                            text: 'استفاده از مکان فعلی',
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            CustomService.determinePosition()
                                .then((point) async {
                              var location = await GeoApi.convertGeoToAddress(
                                  point.longitude.toString(),
                                  point.latitude.toString());
                              txtAddress.text =
                                  location?.formattedAddress ?? '';
                            }).catchError((error, stackTrace) {
                              // if (error.toString().contains('service')) {
                              //   serviceDisableReation();
                              //   return;
                              // }
                              EasyLoading.showError(error);
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldTags(
                      textfieldTagsController: _tagController,
                      initialTags: const [
                        'pick',
                        'your',
                        'favorite',
                        'programming',
                        'language'
                      ],
                      textSeparators: const ['  ', ','],
                      letterCase: LetterCase.normal,
                      validator: (String tag) {
                        if (tag == 'php') {
                          return 'No, please just no';
                        } else if (_tagController.getTags!.contains(tag)) {
                          return 'you already entered that';
                        }
                        return null;
                      },
                      inputfieldBuilder:
                          (context, tec, fn, error, onChanged, onSubmitted) {
                        return ((context, sc, tags, onTagDelete) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: tec,
                              focusNode: fn,
                              decoration: InputDecoration(
                                isDense: true,
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3.0,
                                  ),
                                ),
                                helperText: _tagController.hasTags
                                    ? 'اضافه کردن برچسب'
                                    : '',
                                helperStyle: ThemeController.factory.themeData
                                    .value.textTheme.bodyText1!
                                    .copyWith(color: Colors.grey),
                                labelText: _tagController.hasTags
                                    ? ''
                                    : 'اضافه کردن برچسب',
                                // hintText:
                                //     _tagController.hasTags ? '' : "Enter tag...",
                                errorText: error,
                                prefixIconConstraints: BoxConstraints(
                                    maxWidth: _distanceToField! * 0.74),
                                prefixIcon: tags.isNotEmpty
                                    ? SingleChildScrollView(
                                        controller: sc,
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            children: tags.map((String tag) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                              color:
                                                  CustomColor.backgroundGreen,
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  child: Text(
                                                    '#$tag',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onTap: () {
                                                    print("$tag selected");
                                                  },
                                                ),
                                                const SizedBox(width: 4.0),
                                                InkWell(
                                                  child: const Icon(
                                                    Icons.cancel,
                                                    size: 14.0,
                                                    color: Color.fromARGB(
                                                        255, 233, 233, 233),
                                                  ),
                                                  onTap: () {
                                                    onTagDelete(tag);
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        }).toList()),
                                      )
                                    : null,
                              ),
                              onChanged: onChanged,
                              onSubmitted: onSubmitted,
                            ),
                          );
                        });
                      },
                    ),
                    SizedBox(
                      height: 45,
                      child: CustomButton(
                          showWaitingController: showWaitingBtnController,
                          onTap: () async {
                            showWaitingBtnController.add(true);
                            Future.delayed(Duration(seconds: 5), () {
                              showWaitingBtnController.add(false);
                            });
                            //  Get.off(CityView());
                            if (_formKey.currentState!.validate()) {}
                          },
                          radius: 20,
                          backgroundColor: CustomColor.backgroundGreen,
                          content: TextHeader2(
                            text: 'ثبت اطلاعات',
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void serviceDisableReation() {}
}
