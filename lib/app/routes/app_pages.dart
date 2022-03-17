import 'package:get/get.dart';

import 'package:urlshortener/app/modules/home/bindings/home_binding.dart';
import 'package:urlshortener/app/modules/home/views/home_view.dart';
import 'package:urlshortener/app/modules/introslider/bindings/introslider_binding.dart';
import 'package:urlshortener/app/modules/introslider/views/introslider_view.dart';
import 'package:urlshortener/app/modules/mainscreen/bindings/mainscreen_binding.dart';
import 'package:urlshortener/app/modules/mainscreen/views/mainscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTROSLIDER,
      page: () => IntrosliderView(),
      binding: IntrosliderBinding(),
    ),
    GetPage(
      name: _Paths.MAINSCREEN,
      page: () => MainscreenView(),
      binding: MainscreenBinding(),
    ),
  ];
}
