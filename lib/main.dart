import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
          primaryColor: Colors.cyan.shade300,
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFF2ACFCF),
            // textTheme: ButtonTextTheme.normal,
          ),
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 0.702),
          secondaryHeaderColor: Color(0xFFF46262)),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
