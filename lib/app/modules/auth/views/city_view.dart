import 'package:dar_mahaleh/app/modules/auth/controllers/auth_controller.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../../controllers/theme_controller.dart';
import '../../../data/custom_color.dart';
import '../data/data.dart';
import '../models/city_model_response.dart';
import '../models/province_model_response.dart';

class CityView extends StatefulWidget {
  CityView({Key? key}) : super(key: key);

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtNeighbourhood = TextEditingController();
  TextEditingController txtApartment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundGreen,
      body: Padding(
        padding: EdgeInsets.only(right: 30, left: 30, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              TextHeader2(
                text: 'اطلاعات فردی',
                color: Colors.white,
              ),
              SizedBox(
                height: 30,
              ),
              TextBody(
                text: 'برای کامل کردن حساب خود این اطلاعات را وارد کنید',
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    controller: txtAddress,
                    decoration: InputDecoration(
                        hintText: 'آدرس خیابان',
                        hintStyle: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!
                            .copyWith(color: Colors.white),
                        labelStyle: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!
                            .copyWith(color: Colors.white),
                        //focusColor: Colors.white,
                        //filled: true,

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        fillColor: CustomColor.backgroundGreen)),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    controller: txtNeighbourhood,
                    decoration: InputDecoration(
                        hintText: 'نام محله',
                        hintStyle: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!
                            .copyWith(color: Colors.white),
                        labelStyle: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!
                            .copyWith(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        fillColor: CustomColor.backgroundGreen)),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    controller: txtApartment,
                    decoration: InputDecoration(
                        hintText: 'آپارتمان،سوییت،واحد و غیره',
                        hintStyle: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!
                            .copyWith(color: Colors.white),
                        labelStyle: ThemeController
                            .factory.themeData.value.textTheme.bodyText1!
                            .copyWith(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        fillColor: CustomColor.backgroundGreen)),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: CustomButton(
                    onTap: () {
                      Get.offAndToNamed('/home');
                    },
                    radius: 20,
                    backgroundColor: Colors.white,
                    content: TextHeader2(
                      text: 'ثبت اطلاعات',
                      color: CustomColor.backgroundGreen,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
