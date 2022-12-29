import 'package:carousel_slider/carousel_slider.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/User_details_model.dart';
import '../controllers/user_controller.dart';

class UserView extends StatefulWidget {
  final UserDetailsModel userDetailsModel;
  UserView({required this.userDetailsModel});
  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<Widget> imageSliders = [];
  @override
  void initState() {
    imageSliders = widget.userDetailsModel.coverImageUrls
        .map((item) => Container(
              child: Container(
                // color: Colors.red,
                //margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        ImageLoader(imageUrl: item),
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
                              'No. ${widget.userDetailsModel.coverImageUrls.indexOf(item)} image',
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
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.greyBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              color: CustomColor.backgroundGreen,
              height: 270,
              //width: 700,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
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
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 10, end: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    CustomColor.backgroundGreenLight,
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    CustomColor.backgroundGreenLight,
                                child: Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    CustomColor.backgroundGreenLight,
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                              )
                            ],
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
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: CustomColor.backgroundGreen),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.userDetailsModel.coverImageUrls
                    .asMap()
                    .entries
                    .map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.white)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeader(text: widget.userDetailsModel.userName),
                        SizedBox(
                          height: 10,
                        ),
                        TextBody(
                            text:
                                'محله ${widget.userDetailsModel.parish} زندگی می کند .')
                      ],
                    ),
                    UserAvatar(userImageUrl: widget.userDetailsModel.userImage)
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width,
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
              decoration: BoxDecoration(color: Colors.white),
              child: TextBody(
                text: widget.userDetailsModel.description,
                textAlign: TextAlign.justify,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
