import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dar_mahaleh/app/modules/auth/controllers/auth_controller.dart';
import 'package:dar_mahaleh/app/modules/auth/views/city_view.dart';
import 'package:dar_mahaleh/tools/custom_service.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../../controllers/theme_controller.dart';
import '../../../data/custom_color.dart';
import '../data/data.dart';
import '../models/city_model_response.dart';
import '../models/province_model_response.dart';
import 'package:geolocator/geolocator.dart';

class PersonalView extends StatefulWidget {
  PersonalView({Key? key}) : super(key: key);

  @override
  State<PersonalView> createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtFamily = TextEditingController();
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtProvince = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtZipCode = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  // AuthController controller = Get.find<AuthController>();
  @override
  void initState() {
    // CustomService.determinePosition()
    //     .then((value) => print('object'))
    //     .catchError((error, stackTrace) {
    //   if (error.toString().contains('service')) {
    //     serviceDisableReation();
    //     return;
    //   }
    //   EasyLoading.showError(error);
    // });
    super.initState();
  }

  serviceDisableReation() {
    AwesomeDialog dialog = AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.warning,
        body: Center(
            child: TextBody(
          text:
              'در صورتی که تمایل دارید موقعیت مکانی بهتر برای ارسال کالاها و دیگر خدمات در دسترس نرم افزار قرار گیرد ، لطفا ابتدا سرویس موقعیت مکانی گوشی خود را روشن کرده و دکمه روشن کردم را انتخاب کنید . .',
        )),
        title: 'This is Ignored',
        desc: 'This is also Ignored',
        btnOkText: 'روشن کردم',
        btnCancelText: 'بی خیال',
        btnOkOnPress: () async {
          Get.back();
          CustomService.determinePosition()
              .then((value) => print('object'))
              .catchError((error, stackTrace) {
            if (error.toString().contains('service')) {
              Future.delayed(Duration(seconds: 5), serviceDisableReation());
              return;
            }
            EasyLoading.showError(error);
          });
        },
        btnCancelOnPress: () {
          Get.back();
        });

    dialog.show();
  }

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
                    controller: txtName,
                    decoration: InputDecoration(
                        hintText: 'نام شما',
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
                    controller: txtFamily,
                    decoration: InputDecoration(
                        hintText: 'نام خانوادگی',
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
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'استان',
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
                        fillColor: CustomColor.backgroundGreen),
                    controller: this.provinceController,
                  ),
                  suggestionsCallback: (pattern) async {
                    return await AuthController.factory.getSuggestions(pattern);
                  },
                  itemBuilder: (context, ProvinceModelResponse suggestion) {
                    return ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text(suggestion.xProvinceName!),
                      // subtitle: Text('${suggestion.xProvinceIdPk}'),
                    );
                  },
                  onSuggestionSelected: (ProvinceModelResponse suggestion) {
                    // Navigator.of(context).push<void>(MaterialPageRoute(
                    //     builder: (context) => ProductPage(product: suggestion)));
                    AuthController.factory.selectedProvinceId =
                        suggestion.xProvinceIdPk;
                    provinceController.text = suggestion.xProvinceName!;
                    cityController.text = '';
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'شهر',
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
                        fillColor: CustomColor.backgroundGreen),
                    controller: this.cityController,
                  ),
                  suggestionsCallback: (pattern) async {
                    return await AuthController.factory
                        .getCitySuggestions(pattern);
                  },
                  itemBuilder: (context, CityModelResponse suggestion) {
                    return ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text(suggestion.xCityName!),
                      //subtitle: Text('${suggestion.xCityIdPk}'),
                    );
                  },
                  onSuggestionSelected: (CityModelResponse suggestion) {
                    // Navigator.of(context).push<void>(MaterialPageRoute(
                    //     builder: (context) => ProductPage(product: suggestion)));
                    cityController.text = suggestion.xCityName!;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: CustomButton(
                    onTap: () {
                      Get.off(CityView());
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
