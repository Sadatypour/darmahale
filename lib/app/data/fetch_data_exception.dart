import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:get/get.dart';

class FetchDataException implements Exception {
  final String _message;
  static bool _isOpen = false;
  FetchDataException(this._message) {
    handleException();
  }

  String toString() {
    if (_message == null) return "Exception";
    return "$_message";
  }

  void handleException() {
    if (_message.contains('Socket')) {
      // EasyLoading.showError('اتصال به اینترنت را بررسی کنید');
      //  if(_isOpen==false){
      //   _isOpen = true;
      //     Get.dialog(Scaffold(body: Container(child: TextHeader(text: 'اتصال به اینترنت را بررسی کنید',),)),  barrierDismissible: false).then((value) => _isOpen=false);
      //  }

    } else {
      EasyLoading.showError(_message);
    }
  }

  void showRetryMessage({Function? callbackFunc}) {
    if (_message.contains('Socket') ||
        _message.contains('connect') ||
        _message.contains('Connect')) {
      if (_isOpen == false) {
        _isOpen = true;
        Future.delayed(
            Duration(
              seconds: 1,
            ), () {
          var waitResult = Get.dialog(
                  WillPopScope(
                    onWillPop: () async => true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: CustomColor.themePrimaryThree,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 200,
                              width: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextHeader(
                                    text: 'اتصال به اینترنت را بررسی کنید .',
                                    color: Colors.white,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        if (callbackFunc != null) {
                                          Get.back();
                                          callbackFunc();
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.refresh,
                                            color: Colors.red,
                                          ),
                                          TextHeader(
                                            text: 'تلاش دوباره',
                                            color: Colors.red,
                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  barrierDismissible: false)
              .then((value) => _isOpen = false);
          ;
        });
        //Get.dialog(Scaffold(body: Container(child: TextHeader(text: 'اتصال به اینترنت را بررسی کنید',),)),  barrierDismissible: false).then((value) => _isOpen=false);
      }
    }
  }
}
