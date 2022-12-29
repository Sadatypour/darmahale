import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_widgets.dart';

extension ContextExtension on BuildContext {
  void showDialog(Widget content, {Widget? bottomWidget, double? height,double? width,bool? showCloseButton,}) {
    Get.dialog(
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(    
              clipBehavior: Clip.hardEdge,         
             // height: height ?? double.infinity,
              constraints: BoxConstraints.tight(Size(width ?? 300, height ?? 300)),
              margin:
                  EdgeInsets.only(left: 20, right: 20, top: 100),
              padding:
                  EdgeInsets.only( top: 10),
              decoration: BoxDecoration(
                // color: Colors.red,
                  color: Get.theme.dialogBackgroundColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                
                  Column(
                    children: [
                    showCloseButton == true?  Row(
                        children: [
                          CloseHeader(),
                        ],
                      ) : Container(),
                      Container(
                        height: 10,
                      ),
                      content,
                     
                    ],
                  ),
                    Align(
                    alignment: Alignment.bottomCenter,
                    child:  Container(
                    //  color: Colors.yellow,
                     // margin: EdgeInsets.only(top:60),
                      child: bottomWidget ?? Container()),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}