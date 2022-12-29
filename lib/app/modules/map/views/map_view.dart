import 'package:dar_mahaleh/app/controllers/theme_controller.dart';
import 'package:dar_mahaleh/app/data/custom_color.dart';
import 'package:dar_mahaleh/app/modules/user/views/user_view.dart';
import 'package:dar_mahaleh/tools/custom_service.dart';
import 'package:dar_mahaleh/tools/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../data/User_details_model.dart';

class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final MapController _mapController;

  CustomPoint _textPos = const CustomPoint(10.0, 10.0);

  getMarker() {
    return InkWell(
      onTap: () {
        UserDetailsModel userDetailsModel = UserDetailsModel(
            coverImageUrls: [
              'https://assets-global.website-files.com/6019e43dcfad3c059841794a/62d6de37454aa5754ad51ba5_home%20page%20image.jpg',
              'https://www.telefonica.com/en/wp-content/uploads/sites/5/2021/12/pexels-kostiantyn-stupak-599982.jpg?resize=1224,673',
            ],
            starCount: 5,
            parish: 'لویزان',
            userId: 1,
            description: '''
در فرهنگ رایانه، کاربر (به انگلیسی: User) کسی است که با یک سیستم - اعم از سخت‌افزار یا نرم‌افزار تعامل دارد و از آن استفاده می‌کند. در بیشتر مواقع، کاربر انسان است.[۱] واژهٔ کاربر، استعاره‌ای است که بین افرادی که در پیاده‌سازی سیستم مشارکت داشته‌اند (مانند برنامه‌نویسان)، و استفاده‌کنندگان واقعی از آن (مانند اپراتورها)، تمایز ایجاد می‌کند. گاهی برای تأکید، از اصطلاحاتی مانند کاربر نهایی (End-user) یا کاربر نابرنامه‌ساز (Non-programmer User) هم استفاده می‌شود. هر سیستم می‌تواند یک یا چند نوع کاربر داشته باشد؛ برای نمونه، در ویکی‌پدیای فارسی، چندین نوع کاربر وجود دارد، از جمله: مدیران، مشارکت‌کنندگان، و بازدیدکنندگان

''',
            userImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&usqp=CAU',
            userName: 'علیرضا کیانی مقدم');
        Get.to(UserView(userDetailsModel: userDetailsModel));
      },
      child: UserAvatarLarge(
        userImageUrl: 'http://tagweb.ir/upload/Images/editor/pp.jpg',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void onMapEvent(MapEvent mapEvent) {
    if (mapEvent is! MapEventMove && mapEvent is! MapEventRotate) {
      // do not flood console with move and rotate events
      debugPrint(mapEvent.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var marker = <Marker>[
      Marker(
        width: 60,
        height: 60,
        point: LatLng(32.64263, 51.70595),
        builder: (context) {
          return getMarker();
        },
      ),
      Marker(
        width: 60,
        height: 60,
        point: LatLng(32.64273, 51.70545),
        builder: (context) {
          return getMarker();
        },
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('موقعیت شما روی نقشه'),
          backgroundColor: CustomColor.backgroundGreen,
          titleTextStyle: ThemeController
              .factory.currentTheme.value.theme!.textTheme!.headline1!
              .copyWith(color: Colors.white),
          iconTheme: Get.theme.iconTheme.copyWith(color: Colors.white),
        ),
        // drawer: buildDrawer(context, LatLngScreenPointTestPage.route),
        body: FutureBuilder<Position>(
            future: CustomService.determinePosition(),
            builder: (context, snapshot) {
              if (!snapshot.hasError && !snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: TextHeader2(text: snapshot.error.toString())),
                );
              }
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      maxZoom: 18,
                      onMapEvent: onMapEvent,
                      onTap: (tapPos, latLng) {
                        final pt1 = _mapController.latLngToScreenPoint(latLng);
                        _textPos = CustomPoint(pt1!.x, pt1.y);
                        setState(() {});
                      },
                      // center: LatLng(
                      //     snapshot.data!.latitude, snapshot.data!.longitude),
                      center: LatLng(32.64263, 51.70595),

                      zoom: 18,
                      rotation: 0,
                    ),
                    // children: [
                    //   TileLayer(
                    //     urlTemplate:
                    //         'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    //     userAgentPackageName:
                    //         'dev.fleaflet.flutter_map.example',
                    //   ),
                    // ],
                    children: [
                      PolygonLayer(
                        polygonCulling: true,
                        polygons: [
                          Polygon(
                            points: [
                              LatLng(21.235293892731804, 72.85903282651766),
                              LatLng(21.235293892731904, 72.85903282651866),
                            ],
                            color: Colors.blue,
                          ),
                          // Polygon(
                          //   points: [
                          //     LatLng(21.235293892731804, 72.85903282651766),
                          //     LatLng(21.235293892731804, 72.85903282651766)
                          //   ],
                          //   color: Colors.blue,
                          // ),
                          // Polygon(
                          //   points: [
                          //     LatLng(21.235293892731804, 72.85903282651766),
                          //     LatLng(21.235293892731804, 72.85903282651766)
                          //   ],
                          //   color: Colors.blue,
                          // ),
                          // Polygon(
                          //   points: [
                          //     LatLng(21.235293892731804, 72.85903282651766),
                          //     LatLng(21.235293892731804, 72.85903282651766)
                          //   ],
                          //   color: Colors.blue,
                          // ),
                        ],
                      ),
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      MarkerLayer(
                        markers: marker,
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //     left: _textPos.x.toDouble(),
                //     top: _textPos.y.toDouble(),
                //     width: 20,
                //     height: 20,
                //     child: const FlutterLogo()),
              ]);
            }));
  }
}
