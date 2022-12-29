import 'package:flutter/material.dart';

class CustomColor {
  static const Color green = Color(0xFF4AC0C9);
  static const Color themeGrey = Color(0xFFDEE0E2);
  static const Color themePrimary = Color.fromRGBO(255, 134, 94, 1);
  static const Color themePrimaryTwo = Color(0XFFFCF5F2);
  static const Color themePrimaryThree = Color(0XFF4AC0C9);
  static const Color themePrimaryFour = Color(0XFFE5FAFC);

  static const Color themeDashUnselect = Color.fromRGBO(222, 224, 229, 1);

  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundGreen = Color(0xFF399682);
  static const Color backgroundGreenLight = Color(0xFF85BCB0);
  static Color backLight = Color(0xffD9D9D9).withOpacity(0.15);

  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Colors.black54;
  static const Color greyBackground = Color(0XFFF1F1F3);
  static const Color dark_grey = Colors.black87;
  static const Color lightgrey = Color(0xFFE6E6E6);
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color fidColor = Color(0XFF6dccd4);
  // static const Color primaryColor = Color(0xFFFA7D82);
  static const Color primaryColor = Color(0xFF3A5160);

  static const Color primaryYellowColor = Color.fromRGBO(248, 225, 91, 0.9);
  // static const Color loginGradientStart = Color(0xFFfbab66);
  // static const Color loginGradientEnd = Color(0xFFf7418c);
  static const Color loginGradientStart = Color(0xFFFAFAFA);
  static const Color loginGradientEnd = Color(0xFF3A5160);

  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static MaterialColor primaryMaterialColor = const MaterialColor(0xFFFA7D82, {
    50: Color(0xFFFA7D82),
    100: Color(0xFFFA7D82),
    200: Color(0xFFFA7D82),
    300: Color(0xFFFA7D82),
    400: Color(0xFFFA7D82),
    500: Color(0xFFFA7D82),
    600: Color(0xFFFA7D82),
    700: Color(0xFFFA7D82),
    800: Color(0xFFFA7D82),
    900: Color(0xFFFA7D82)
  });

  static MaterialColor primaryGreyMaterialColor =
      const MaterialColor(0xFFFA7D82, {
    50: Color(0xFF646970),
    100: Color(0xFF50575e),
    200: Color(0xFF3c434a),
    300: Color(0xFF2c3338),
    400: Color(0xFF1d2327),
    500: Color(0xFF101517),
    600: Color(0xFF101517),
    700: Color(0xFF101517),
    800: Color(0xFF101517),
    900: Color(0xFF101517)
  });
}
