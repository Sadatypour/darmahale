import 'dart:async';

import 'package:better_player/better_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dar_mahaleh/app/data/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dar_mahaleh/app/controllers/theme_controller.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';

import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

import 'dart:io';

import '../app/data/api_urls.dart';
import '../app/data/comment_model.dart';
import '../app/data/fetch_input_model.dart';
import '../app/data/image_title.dart';
import '../app/data/title_value.dart';
import '../app/modules/home/models/post_paged_response_model.dart';
// import '../app/modules/dashboard/controllers/list_episode_controller.dart';
// import '../app/modules/dashboard/views/list_episodes_widget.dart';

// import 'music.dart';
// import 'tools/tools.dart';
class DashWidget extends StatelessWidget {
  final Color color;
  const DashWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(58),
          topRight: Radius.circular(58),
          bottomLeft: Radius.circular(58),
          bottomRight: Radius.circular(58),
        ),
        color: color,
        //color: Colors.red,
      ),
    );
  }
}

// class CustomButton extends StatefulWidget {
//   final Widget content;
//   final Function? onTap;
//   final Color? backgroundColor;
//   final double radius;
//   final bool showWiting;
//   CustomButton(
//       {Key? key,
//       required this.content,
//       this.onTap,
//       this.backgroundColor,
//       this.radius = 10,
//       this.showWiting = false})
//       : super(key: key);

//   @override
//   State<CustomButton> createState() => CustomButtonState();
// }

// class CustomButtonState extends State<CustomButton> {
//   ThemeController themeController = Get.find<ThemeController>();

//   // StreamController<bool> buttonIsWaitingController =
//   //     StreamController.broadcast();
//   bool isWaiting = false;
//   @override
//   void dispose() {
//     print('dispose button');
//     // buttonIsWaitingController.close();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     // buttonIsWaitingController.stream.listen((event) {
//     //   setState(() {
//     //     isWaiting == event;
//     //   });
//     // });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (widget.onTap != null && isWaiting == false)
//           ? () {
//               widget.onTap!();
//             }
//           : () {},
//       child: Container(
//         width: double.infinity,
//         // margin: const EdgeInsets.only(top: 340.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
//           gradient: LinearGradient(
//             colors: <Color>[
//               widget.backgroundColor == null
//                   ? CustomColor.themePrimary
//                   : widget.backgroundColor!,
//               widget.backgroundColor == null
//                   ? CustomColor.themePrimary
//                   : widget.backgroundColor!,
//             ],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//             child: widget.showWiting == true
//                 ? const SizedBox(
//                     height: 15,
//                     width: 15,
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ))
//                 : Container(child: widget.content),
//             // child: StreamBuilder(
//             //   stream: buttonIsWaitingController.stream,
//             //   initialData: false,
//             //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//             //     if (snapshot.hasData && snapshot.data == true) {
//             //       return const SizedBox(
//             //           height: 15,
//             //           width: 15,
//             //           child: CircularProgressIndicator(
//             //             color: Colors.white,
//             //           ));
//             //     }
//             //     return Container(child: widget.content);
//             //   },
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomButton extends StatefulWidget {
  final Widget content;
  final Function? onTap;
  final Color? backgroundColor;
  final double radius;

  StreamController<bool>? showWaitingController;
  CustomButton(
      {Key? key,
      required this.content,
      this.onTap,
      this.backgroundColor,
      this.radius = 10,
      this.showWaitingController})
      : super(key: key);

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  ThemeController themeController = Get.find<ThemeController>();

  // StreamController<bool> buttonIsWaitingController =
  //     StreamController.broadcast();
  bool isWaiting = false;
  @override
  void dispose() {
    print('dispose button');
    // buttonIsWaitingController.close();
    widget.showWaitingController?.close();
    super.dispose();
  }

  @override
  void initState() {
    // buttonIsWaitingController.stream.listen((event) {
    //   setState(() {
    //     isWaiting == event;
    //   });
    // });

    widget.showWaitingController?.stream.listen((event) {
      setState(() {
        isWaiting == event;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      ),
      child: Material(
        color: widget.backgroundColor == null
            ? CustomColor.themePrimary
            : widget.backgroundColor!,
        child: InkWell(
          onTap: (widget.onTap != null && isWaiting == false)
              ? () async {
                  if (widget.showWaitingController != null) {
                    // bool? value =
                    //     await widget.showWaitingController!.stream.last;
                    // int allValuesCount =
                    //     await widget.showWaitingController!.stream.length;
                    // if (value == false) {
                    widget.onTap!();
                    //  }
                  } else {
                    widget.onTap!();
                  }
                }
              : () {},
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              // child: widget.showWiting == true
              //     ? const SizedBox(
              //         height: 15,
              //         width: 15,
              //         child: CircularProgressIndicator(
              //           color: Colors.white,
              //         ))
              //     : Container(child: widget.content),
              child: StreamBuilder(
                stream: widget.showWaitingController?.stream,
                initialData: false,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData && snapshot.data == true) {
                    return const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ));
                  }
                  return Container(child: widget.content);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextHeader extends StatelessWidget {
  final String text;
  Color? color;
  TextHeader({Key? key, required this.text, this.color}) : super(key: key);
  ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: color == null
          ? themeController.currentTheme.value.theme!.textTheme!.headline1!
              .copyWith(fontSize: 17)
          : themeController.currentTheme.value.theme!.textTheme!.headline1!
              .copyWith(color: color, fontSize: 17),
    );
  }
}

class TextHeader2 extends StatelessWidget {
  final String text;
  Color? color;
  TextAlign? textAlign;
  TextHeader2(
      {Key? key,
      required this.text,
      this.color,
      this.textAlign = TextAlign.start})
      : super(key: key);
  ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: color == null
          ? themeController.currentTheme.value.theme!.textTheme!.headline1!
              .copyWith(fontSize: 14)
          : themeController.currentTheme.value.theme!.textTheme!.headline1!
              .copyWith(fontSize: 14, color: color),
    );
  }
}

class TextSubtitle extends StatelessWidget {
  final String text;
  TextSubtitle({Key? key, required this.text}) : super(key: key);
  ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: themeController.currentTheme.value.theme!.textTheme!.subtitle2!
          .copyWith(fontSize: 14),
    );
  }
}

class TextBody extends StatelessWidget {
  final String text;
  Color? color;
  TextAlign? textAlign;
  TextBody(
      {Key? key,
      required this.text,
      this.color,
      this.textAlign = TextAlign.start})
      : super(key: key);
  ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: color == null
          ? themeController.currentTheme.value.theme!.textTheme!.bodyText1!
              .copyWith(fontSize: 14)
          : themeController.currentTheme.value.theme!.textTheme!.bodyText1!
              .copyWith(fontSize: 14, color: color),
    );
  }
}

class LogoH extends StatelessWidget {
  Color? color;
  LogoH({
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      TextHeader(
        text: 'NESOOM',
        color: color,
      ),
      Image.asset(
        'assets/images/icon.png',
        width: 50,
      ),
    ]);
  }
}

class Logov extends StatelessWidget {
  late Color color;
  Logov({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/icon.png',
        width: 200,
      ),
      TextHeader(
        text: 'NESOOM',
        color: color,
      )
    ]);
  }
}

class ReminderSliderH extends StatefulWidget {
  final double width;
  final double percent;
  final int remindInt;
  ReminderSliderH(
      {Key? key,
      required this.width,
      required this.percent,
      required this.remindInt})
      : super(key: key);

  @override
  State<ReminderSliderH> createState() => _ReminderSliderHState();
}

class _ReminderSliderHState extends State<ReminderSliderH> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 30,
      width: widget.width,
      decoration: BoxDecoration(
        color: CustomColor.themePrimaryTwo,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: widget.width * widget.percent,
            height: 10,
            decoration: BoxDecoration(
                color: CustomColor.themePrimary,
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        Positioned(
            left: max(10, widget.width * widget.percent - 60),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: CustomColor.themePrimary, spreadRadius: 2),
                    BoxShadow(color: Colors.white, spreadRadius: 2),
                  ]),
              child: TextHeader2(text: '${widget.remindInt} روز'),
            ))
      ]),
    );
  }
}

class ListItem extends StatefulWidget {
  final Widget leftWidget;
  final String title;
  final bool isSelect;
  ListItem(
      {Key? key,
      required this.leftWidget,
      required this.title,
      required this.isSelect})
      : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColor.lightgrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              widget.leftWidget,
              Container(
                width: 10,
              ),
              TextBody(text: widget.title),
            ],
          ),
          (widget.isSelect == false)
              ? Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.lightgrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              : Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: CustomColor.themePrimaryThree,
                    //  border: Border.all(color: CustomColor.themePrimaryThree),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class BodyItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSelect;
  const BodyItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.isSelect})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group1010Widget - COMPONENT
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Color.fromRGBO(248, 254, 255, 1),
            border: Border.all(
              color: CustomColor.lightgrey,
              width: 1,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Color(0XFFCFF0F2),
                        borderRadius: BorderRadius.circular(15),
                        // border: Border.all(
                        //   // color: Color.fromRGBO(74, 192, 200, 1),
                        //   width: 1,
                        // ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: AssetImage(
                          //   'assets/images/Closeportraityoungsmilinghandsome260nw1180874596removebgpreview1.png',
                          image: Image.network(imageUrl).image,
                        ))),
                TextHeader2(text: title)
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
                visible: isSelect,
                child: CircleAvatar(
                    backgroundColor: CustomColor.themePrimary,
                    radius: 12,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ))),
          ),
        )
      ],
    );
  }
}

class ImageTextItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final bool isSelect;
  // final Key key;
  ImageTextItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.isSelect})
      : super(key: key);
  @override
  State<ImageTextItem> createState() => _ImageTextItemState();
}

class _ImageTextItemState extends State<ImageTextItem> {
  ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group1010Widget - COMPONENT
    return Stack(
      children: [
        Container(
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            // color: Color.fromRGBO(248, 254, 255, 1),
            border: Border.all(
              color: CustomColor.lightgrey,
              width: 1,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0XFFCFF0F2),
                    shape: BoxShape.circle,
                  ),
                  width: 50,
                  height: 50,
                  child: Image.network(widget.imageUrl)),
              Text(
                widget.title,
                style: themeController
                    .currentTheme.value.theme!.textTheme!.bodyText1,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
                visible: widget.isSelect,
                child: CircleAvatar(
                    backgroundColor: CustomColor.themePrimary,
                    radius: 12,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ))),
          ),
        )
      ],
    );
  }
}

class CheckboxListItem extends StatefulWidget {
  final String title;
  final bool isSelect;
  CheckboxListItem({Key? key, required this.title, required this.isSelect})
      : super(key: key);

  @override
  _CheckboxListItemState createState() => _CheckboxListItemState();
}

class _CheckboxListItemState extends State<CheckboxListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColor.lightgrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 10,
              ),
              TextBody(text: widget.title),
            ],
          ),
          (widget.isSelect == false)
              ? Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.lightgrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              : Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: CustomColor.themePrimaryThree,
                    //  border: Border.all(color: CustomColor.themePrimaryThree),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  )),
                )
        ],
      ),
    );
  }
}

class RadioBoxListItem extends StatefulWidget {
  final String title;
  final bool isSelect;
  RadioBoxListItem({Key? key, required this.title, required this.isSelect})
      : super(key: key);

  @override
  _RadioBoxListItemState createState() => _RadioBoxListItemState();
}

class _RadioBoxListItemState extends State<RadioBoxListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColor.lightgrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 10,
              ),
              TextBody(text: widget.title),
            ],
          ),
          (widget.isSelect == false)
              ? Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.lightgrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              : Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: CustomColor.themePrimaryThree,
                    //  border: Border.all(color: CustomColor.themePrimaryThree),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  final List<TitleValue> chartData;
  BarChartWidget({Key? key, required this.chartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsetsDirectional.only(start: 10, end: 10),
          width: max(100, chartData.length * 35),
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData,
              borderData: borderData,
              barGroups: getBarGroups(),
              gridData: FlGridData(show: true),
              alignment: BarChartAlignment.spaceAround,

              maxY: chartData
                  .map((e) => e.value!)
                  .toList()
                  .reduce((curr, next) => curr > next ? curr : next)
                  .toDouble(), //محاسبه ما
            ),
          ),
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                //color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return Transform.rotate(
        angle: -45, child: Text(getTitleFromChartData(value), style: style));
  }

  String getTitleFromChartData(double value) {
    int intValue = value.toInt();

    if (intValue <= chartData.length && intValue != 0) {
      print('$intValue =>  ${chartData[intValue - 1].title!}');
      return chartData[intValue - 1].title!;
    }
    return '';
  }

  Widget getTopCaption(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    return Container();
    // return Transform.rotate(
    //     angle: -45, child: Text(getTopCaptionFromChartData(value), style: style));
  }

  String getTopCaptionFromChartData(double value) {
    int intValue = value.toInt();

    if (intValue <= chartData.length && intValue != 0) {
      print('$intValue =>  ${chartData[intValue - 1].title!}');
      return chartData[intValue - 1].value!.toString();
    }
    return '';
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 90,
            interval: 1,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 80,
            interval: 1,
            getTitlesWidget: getTopCaption,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  final _barsGradient = const LinearGradient(
    colors: [
      CustomColor.primaryColor,
      CustomColor.primaryColor
      // Colors.lightBlueAccent,
      // Colors.greenAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> getBarGroups() {
    List<BarChartGroupData> result = chartData.map((e) {
      return BarChartGroupData(
        x: chartData.indexOf(e),
        barRods: [
          BarChartRodData(
            toY: e.value!.toDouble(),
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      );
    }).toList();
    result.add(BarChartGroupData(
      x: chartData.length,
      barRods: [
        BarChartRodData(
          toY: 0,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [15],
    ));
    return result;
  }
}
//*******Barchart end ********/

class LineChartWidget extends StatelessWidget {
  LineChartWidget({required this.chartData});
  int counterIndex = -1;
  final List<TitleValue> chartData;

  @override
  Widget build(BuildContext context) {
    //  return  Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     child: Container(
    //       padding: EdgeInsetsDirectional.only(start: 10,end: 10),
    //       width: max(100, chartData.length * 35) ,

    counterIndex = -1;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: max(100, chartData.length * 50),
          margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
          child: LineChart(
            sampleData2,
            swapAnimationDuration: const Duration(milliseconds: 250),
          ),
        ),
      ),
    );

    // counterIndex = -1;
    // return LineChart(
    //   sampleData2,
    //   swapAnimationDuration: const Duration(milliseconds: 250),
    // );
  }

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: chartData.length.toDouble(),
        maxY: chartData
                .map((e) => e.value!)
                .toList()
                .reduce((curr, next) => curr > next ? curr : next)
                .toDouble() +
            20, //محاسبه ماکسیمم مقدار
        minY: 0,
      );

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: true,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 80,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_3,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontFamily: 'yekan',
      fontSize: 14,
    );

    return Text(value.toString(), style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        // interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontFamily: 'yekan',
      fontSize: 12,
    );

    return Transform.rotate(
      angle: -20,
      child: Padding(
          child: Text(getTitleFromChartData(value), style: style),
          padding: const EdgeInsets.only(top: 10.0)),
    );
  }

  String getTitleFromChartData(double value) {
    // int intValue = value.toInt();
    // Iterable<TitleValue> result =
    //     chartData.where((element) => element.value! == intValue);
    // if (result.isNotEmpty) {

    // return result.first.value.toString();
    // }
    // return '';
    //**************
    int intValue = value.toInt();

    if (intValue < chartData.length) {
      return chartData[intValue].title!;
    }
    return '';
  }

  FlGridData get gridData => FlGridData(show: true);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: CustomColor.primaryColor,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: true),
        spots: chartData.map((e) {
          return FlSpot(chartData.indexOf(e).toDouble(), e.value!.toDouble());
        }).toList(),
        // spots: const [
        //   FlSpot(1, 3.8),
        //   FlSpot(3, 1.9),
        //   FlSpot(6, 5),
        //   FlSpot(10, 3.3),
        //   FlSpot(13, 4.5),
        // ],
      );
}

//Linechart end

class Section extends StatefulWidget {
  final String title;
  final List<ImageTitle> data;
  final Color backgroundColor;
  final Function(int) itemClicked;
  final Function() showMoreClicked;
  Section(
      {Key? key,
      required this.title,
      required this.data,
      required this.itemClicked,
      required this.showMoreClicked,
      this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.only(bottom: 5),
      //constraints: BoxConstraints(maxHeight: Get.height * 1 / 3),
      padding: EdgeInsetsDirectional.only(start: 5, end: 5, top: 10, bottom: 5),
      decoration: BoxDecoration(color: widget.backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBody(text: widget.title),
              InkWell(
                onTap: () {
                  widget.showMoreClicked();
                },
                child: Row(
                  children: [
                    TextSubtitle(text: 'بیشتر'),
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...widget.data.map((e) => Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 10, top: 5, bottom: 5),
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 177,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey[400]!,
                                    width: 2,
                                    strokeAlign: StrokeAlign.outside,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey[400]!,
                                    width: 2,
                                    strokeAlign: StrokeAlign.outside,
                                  ),
                                  left: BorderSide(
                                    color: Colors.grey[400]!,
                                    width: 2,
                                    strokeAlign: StrokeAlign.outside,
                                  ),
                                  right: BorderSide(
                                    color: Colors.grey[400]!,
                                    width: 2,
                                    strokeAlign: StrokeAlign.outside,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[400]!,
                                    blurRadius: 4,
                                    offset: Offset(5, 10), // Shadow position
                                  ),
                                ],
                                image: DecorationImage(
                                  image: Image.network(
                                    e.imageUrl,
                                    fit: BoxFit.fitHeight,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ).image,
                                )),
                          ),
                          onTap: () {
                            widget.itemClicked(e.id);
                          },
                        ),
                        // TextBody(text: e.title),
                      ],
                    ),
                  ))
            ],
          )),
        ],
      ),
    );
  }
}

class PostSection extends StatefulWidget {
  final String title;
  final List<PostModel> data;
  final Color backgroundColor;
  final Function(int) itemClicked;
  final Function(int) userImageClicked;
  final Function() showMoreClicked;

  PostSection(
      {Key? key,
      required this.title,
      required this.data,
      required this.itemClicked,
      required this.showMoreClicked,
      this.backgroundColor = Colors.white,
      required this.userImageClicked})
      : super(key: key);

  @override
  State<PostSection> createState() => _PostSectionState();
}

class UserAvatar extends StatelessWidget {
  final String userImageUrl;
  UserAvatar({Key? key, required this.userImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 50,
      height: 50,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: CustomColor.backgroundGreen,
            strokeAlign: StrokeAlign.outside,
          ),
          shape: BoxShape.circle),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.network(userImageUrl)),
    );
  }
}

class UserAvatarLarge extends StatelessWidget {
  final String userImageUrl;
  UserAvatarLarge({Key? key, required this.userImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(5),
      width: 100,
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: CustomColor.backgroundGreen,
            strokeAlign: StrokeAlign.outside,
          ),
          shape: BoxShape.circle),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.network(userImageUrl)),
    );
  }
}

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  ImageLoader({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}

class _PostSectionState extends State<PostSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 5, end: 5, top: 10, bottom: 5),
      decoration: BoxDecoration(color: widget.backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBody(text: widget.title),
              InkWell(
                onTap: () {
                  widget.showMoreClicked();
                },
                child: Row(
                  children: [
                    TextSubtitle(text: 'بیشتر'),
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...widget.data.map((e) => Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 10, top: 5, bottom: 5),
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            // height: 350,
                            width: Get.width * 4 / 5,

                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          widget.userImageClicked(e.userId);
                                        },
                                        child: UserAvatar(
                                          userImageUrl: e.userImage,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextHeader2(text: e.userName)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 50,
                                    child: TextBody(text: e.summary)),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    height: 200,
                                    child: ImageLoader(imageUrl: e.imageUrl)),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(CupertinoIcons.heart),
                                        TextSubtitle(text: '${12} پسندیده'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(Icons.comment_outlined),
                                        TextSubtitle(text: '${10} نظر')
                                      ],
                                    ),
                                    TextSubtitle(text: '20 دقیقه قبل')
                                  ],
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            widget.itemClicked(e.id);
                          },
                        ),
                        // TextBody(text: e.title),
                      ],
                    ),
                  ))
            ],
          )),
        ],
      ),
    );
  }
}

class CustomCarousel extends StatefulWidget {
  final List<String> imageUrls;
  CustomCarousel({Key? key, required this.imageUrls}) : super(key: key);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final CarouselController _controller = CarouselController();
  List<Widget> imageSliders = [];
  int _current = 0;
  @override
  void initState() {
    super.initState();
    imageSliders = widget.imageUrls
        .map((item) => Container(
              width: double.infinity,
              // color: Colors.yellow,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: ImageLoader(imageUrl: item)),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                          child: Text(
                            'No. ${widget.imageUrls.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            //child: Container(color: Colors.red),
            child: CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: false,
                  // enlargeCenterPage: true,
                  viewportFraction: 1,
                  //aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(color: CustomColor.backLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imageUrls.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostItemWidget extends StatelessWidget {
  final PostItem postModel;
  const PostItemWidget({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      // width: Get.width * 4 / 5,
      padding:
          EdgeInsetsDirectional.only(start: 10, end: 10, top: 10, bottom: 10),
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    //  widget.userImageClicked(e.userId);
                  },
                  child: UserAvatar(
                    userImageUrl: postModel.userImage!,
                  )),
              SizedBox(
                width: 10,
              ),
              TextHeader2(text: postModel.userName!)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(height: 50, child: TextBody(text: postModel.summary!)),
          SizedBox(
            height: 5,
          ),
          Container(
              //color: Colors.red,
              width: Get.width,
              height: 200,
              child: postModel.imageUrls?.length == 1
                  ? ImageLoader(imageUrl: postModel.imageUrls![0])
                  : CustomCarousel(
                      imageUrls: postModel.imageUrls!,
                    )),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   height: 0.5,
          //   color: Colors.grey,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.heart),
                  TextSubtitle(text: '${12} پسندیده'),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.comment_outlined),
                  TextSubtitle(text: '${10} نظر')
                ],
              ),
              TextSubtitle(text: '20 دقیقه قبل')
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 0.2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class PostItemVideoWidget extends StatefulWidget {
  final PostItem postModel;
  const PostItemVideoWidget({Key? key, required this.postModel})
      : super(key: key);

  @override
  State<PostItemVideoWidget> createState() => _PostItemVideoWidgetState();
}

class _PostItemVideoWidgetState extends State<PostItemVideoWidget> {
  late BetterPlayerDataSource betterPlayerDataSource;
  late BetterPlayerController _betterPlayerController;
  @override
  void initState() {
    super.initState();
    betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "${widget.postModel.videoUrl}",
      // "https://persianprogrammer.ir/upload/video/_Invitation_Help_yourself__May_I.mp4",
      //https://api.fidibo.com/audio/sample_kontrol_zehn_veraaj_nik.mp3
      // notificationConfiguration: BetterPlayerNotificationConfiguration(
      //   showNotification: true,
      //   title: widget.episodeDetailsResponseModel.title,
      //   author: "نرم افزار گنج",
      //   imageUrl:
      //       '${ApiUrls.root}/upload/${widget.episodeDetailsResponseModel.imageUrl}',
      //   activityName: "MainActivity",
      // ),
    );

    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
          //  autoPlay: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
              textColor: Colors.white,
              iconsColor: Colors.white,
              backgroundColor: CustomColor.backLight),
        ),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      // width: Get.width * 4 / 5,
      padding:
          EdgeInsetsDirectional.only(start: 10, end: 10, top: 10, bottom: 10),
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    //  widget.userImageClicked(e.userId);
                  },
                  child: UserAvatar(
                    userImageUrl: widget.postModel.userImage!,
                  )),
              SizedBox(
                width: 10,
              ),
              TextHeader2(text: widget.postModel.userName!)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
              height: 50, child: TextBody(text: widget.postModel.summary!)),
          SizedBox(
            height: 5,
          ),
          Container(
            //  color: Colors.red,
            width: Get.width,
            height: 200,
            child: BetterPlayer(
              controller: _betterPlayerController,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   height: 0.5,
          //   color: Colors.grey,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.heart),
                  TextSubtitle(text: '${12} پسندیده'),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.comment_outlined),
                  TextSubtitle(text: '${10} نظر')
                ],
              ),
              TextSubtitle(text: '20 دقیقه قبل')
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 0.2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class CloseHeader extends StatelessWidget {
  CloseHeader({Key? key}) : super(key: key);
  ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: themeController.themeData.value.backgroundColor,
            shape: BoxShape.circle),
        child: Center(
            child: Icon(
          Icons.cancel_outlined,
          color: Colors.white,
          size: 35,
        )),
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  final String title;
  final List<CommentModel> data;
  final Function(int) itemClicked;
  CommentSection(
      {Key? key,
      required this.title,
      required this.data,
      required this.itemClicked})
      : super(key: key);

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(maxHeight: Get.height * 1 / 3),
      // margin:EdgeInsetsDirectional.only(start: 5, end: 20, top: 10, bottom: 5),
      padding: EdgeInsetsDirectional.only(start: 5, end: 5, top: 10, bottom: 5),
      decoration: BoxDecoration(
          //color: Colors.red
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextHeader(text: widget.title),
              Row(
                children: [
                  TextSubtitle(text: 'بیشتر'),
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 10,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...widget.data.map((e) => Container(
                    margin: EdgeInsetsDirectional.only(
                        start: 0, end: 20, top: 10, bottom: 5),
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        color: Color(0XFFF1F1F3),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400]!,
                            blurRadius: 1,
                            offset: Offset(1, 2),
                          )
                        ]),
                    child: Container(
                      // height: Get.width * 0.8,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextSubtitle(text: e.userId),
                              TextSubtitle(text: e.date)
                            ],
                          ),
                          TextBody(text: e.comment)
                        ],
                      ),
                    ),
                  ))
            ],
          )),
        ],
      ),
    );
  }
}

class HeaderPageWidget extends StatelessWidget {
  Widget? title;
  Widget? leading;
  Widget? trailing;
  HeaderPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.1,
            blurRadius: 15,
            offset: Offset(0, 0.5), // changes position of shadow
          ),
        ],

        // color: colorPrimary
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(),
          Image.asset(
            'assets/images/icon.png',
            width: 70,
          ),
          Container()
        ],
      ),
    );
  }
}

class HolePainter extends CustomPainter {
  HolePainter({
    required this.color,
    required this.holeSize,
  });

  Color color;
  double holeSize;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = holeSize / 2;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Rect outerCircleRect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
    Rect innerCircleRect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius / 2);

    Path transparentHole = Path.combine(
      PathOperation.difference,
      Path()..addRect(rect),
      Path()
        ..addOval(outerCircleRect)
        ..close(),
    );

    Path halfTransparentRing = Path.combine(
      PathOperation.difference,
      Path()
        ..addOval(outerCircleRect)
        ..close(),
      Path()
        ..addOval(innerCircleRect)
        ..close(),
    );

    canvas.drawPath(transparentHole, Paint()..color = color);
    canvas.drawPath(
        halfTransparentRing, Paint()..color = color.withOpacity(0.5));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class StaggeredRaindropAnimation {
  StaggeredRaindropAnimation(this.controller)
      : dropSize = Tween<double>(begin: 0, end: maximumDropSize).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.2, curve: Curves.easeIn),
          ),
        ),
        dropPosition =
            Tween<double>(begin: 0, end: maximumRelativeDropY).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.2, 0.5, curve: Curves.easeIn),
          ),
        ),
        holeSize = Tween<double>(begin: 0, end: maximumHoleSize).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: Curves.easeIn),
          ),
        ),
        dropVisible = Tween<bool>(begin: true, end: false).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.5),
          ),
        ),
        textOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 0.8, curve: Curves.easeOut),
          ),
        ),
        scaleValue = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1, curve: Curves.easeIn),
          ),
        );

  final AnimationController controller;

  final Animation<double> dropSize;
  final Animation<double> dropPosition;
  final Animation<bool> dropVisible;
  final Animation<double> holeSize;
  final Animation<double> textOpacity;
  final Animation<double> scaleValue;
  static final double maximumDropSize = 20;
  static final double maximumRelativeDropY = 0.5;
  static final double maximumHoleSize = 10;
}
