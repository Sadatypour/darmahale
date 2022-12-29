import 'package:flutter/material.dart';

import 'custom_color.dart';

class MyTheme {
  Brightness? brightness;
  MaterialColor? primarySwatch;
  Color? primaryColor;
  Color? primaryColorDark;
  Color? primaryColorLight;
  TextTheme? textTheme;
  ButtonThemeData? buttonThemeData;
  InputDecorationTheme? inputDecorationTheme;
  TabBarTheme? tabBarTheme;
  MyTheme(
      {this.brightness,
      this.primaryColorDark,
      this.primaryColorLight,
      this.primarySwatch,
      this.primaryColor,
      this.textTheme,
      this.buttonThemeData,
      this.inputDecorationTheme,
      this.tabBarTheme});
}

class AppTheme {
  String name;
  MyTheme? theme;

  AppTheme(this.name, this.theme);
}

List<AppTheme> myThemes = [
  AppTheme(
      'Default',
      MyTheme(
          brightness: Brightness.light,
          primarySwatch: CustomColor.primaryGreyMaterialColor,
          primaryColor: CustomColor.primaryColor,
          primaryColorDark: CustomColor.loginGradientEnd,
          primaryColorLight: CustomColor.lightgrey,
          textTheme: const TextTheme(
              headline1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'yekan',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
              headline2: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'yekan',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
              headline5: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'yekan',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
              bodyText1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'yekan',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              bodyText2: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'yekan',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              subtitle1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'yekan',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              subtitle2: TextStyle(
                  color: CustomColor.deactivatedText,
                  fontFamily: 'yekan',
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              button: TextStyle(color: Colors.white, fontFamily: 'sans')),
          buttonThemeData: ButtonThemeData(
            buttonColor: CustomColor.primaryColor,
            textTheme: ButtonTextTheme.primary,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            //textTheme: ButtonTextTheme.accent,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color.fromRGBO(100, 140, 255, 1.0),
            filled: false,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          tabBarTheme: TabBarTheme(
            unselectedLabelStyle: TextStyle(
                color: CustomColor.grey,
                fontFamily: 'yekan',
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
            labelPadding: EdgeInsets.all(5.0),
            labelColor: CustomColor.deactivatedText,
            unselectedLabelColor: Colors.white,
          ))),
  AppTheme(
      'Teal',
      MyTheme(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              bodyText1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              bodyText2: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              subtitle1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              subtitle2: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              button: TextStyle(color: Colors.white, fontFamily: 'sans')),
          buttonThemeData: ButtonThemeData(
            buttonColor: Color.fromRGBO(255, 213, 79, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            textTheme: ButtonTextTheme.primary,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color.fromRGBO(100, 140, 255, 1.0),
            filled: false,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelPadding: EdgeInsets.all(5.0),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ))),
  AppTheme(
      'Orange',
      MyTheme(
          brightness: Brightness.light,
          primarySwatch: Colors.orange,
          primaryColor: Colors.orange,
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              bodyText1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              bodyText2: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              subtitle1: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              subtitle2: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'sans',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              button: TextStyle(color: Colors.white, fontFamily: 'sans')),
          buttonThemeData: ButtonThemeData(
            buttonColor: Color.fromRGBO(100, 140, 255, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            // textTheme: ButtonTextTheme.accent,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color.fromRGBO(100, 140, 255, 1.0),
            filled: false,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelPadding: EdgeInsets.all(5.0),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ))),
  AppTheme(
      'Dark',
      MyTheme(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          primaryColor: Colors.black,
          primaryColorDark: Colors.black,
          primaryColorLight: Colors.white24,
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              headline5: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              bodyText1: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sans',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              bodyText2: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sans',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              subtitle1: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sans',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              subtitle2: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sans',
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              button: TextStyle(color: Colors.white, fontFamily: 'sans')),
          buttonThemeData: ButtonThemeData(
            buttonColor: Color.fromRGBO(100, 140, 255, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            // textTheme: ButtonTextTheme.accent,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color.fromRGBO(100, 140, 255, 1.0),
            filled: false,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelPadding: EdgeInsets.all(5.0),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ))),
];
