import 'package:bubble/bubble.dart';
import 'package:dar_mahaleh/app/controllers/theme_controller.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.greyBackground,
        appBar: AppBar(
          backgroundColor: CustomColor.backgroundGreen,
          title: Text(
            'اعلان ها',
            style: ThemeController
                .factory.currentTheme.value.theme!.textTheme!.headline1!
                .copyWith(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: ListView(
            children: [
              Bubble(
                alignment: Alignment.center,
                color: Color.fromRGBO(212, 234, 244, 1.0),
                child: Text('امروز',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.0)),
              ),
              SizedBox(
                height: 10,
              ),
              Bubble(
                nip: BubbleNip.rightBottom,
                child: Row(
                  children: [
                    UserAvatar(
                        userImageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&usqp=CAU'),
                    SizedBox(
                      width: 10,
                    ),
                    TextBody(text: 'وحید اکبری پست شما را لایک کرد .'),
                  ],
                ),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 10),
                alignment: Alignment.topRight,
                nip: BubbleNip.rightTop,
                color: Color.fromRGBO(225, 255, 199, 1.0),
                child: Row(
                  children: [
                    UserAvatar(
                        userImageUrl:
                            'https://media.nngroup.com/media/people/photos/2022-portrait-page-3.jpg.600x600_q75_autocrop_crop-smart_upscale.jpg'),
                    SizedBox(
                      width: 10,
                    ),
                    TextBody(text: 'امیر نعمانی پیام جدید ارسال کرده است . .'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Bubble(
                alignment: Alignment.center,
                color: Color.fromRGBO(212, 234, 244, 1.0),
                child: Text('دیروز',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.0)),
              ),
              SizedBox(
                height: 10,
              ),
              Bubble(
                nip: BubbleNip.rightBottom,
                child: Row(
                  children: [
                    UserAvatar(
                        userImageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbFWOHmyNMmuOFWi73ShmxGw0-VO3NK1o-cAbTM7ND7XsttmP35pgpnQ28dTAZBeY2DUw&usqp=CAU'),
                    SizedBox(
                      width: 10,
                    ),
                    TextBody(text: 'سارا کریمی پست شما را لایک کرد .'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
