import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urlshortener/app/data/shortmodel.dart';
import 'package:urlshortener/app/modules/mainscreen/views/resultscreen.dart';

import '../controllers/mainscreen_controller.dart';

class MainscreenView extends GetView<MainscreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('MainscreenView'),
        //   centerTitle: true,
        // ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Shortly',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 23),
              ),
              SvgPicture.asset(
                'assets/images/illustration.svg',
                semanticsLabel: 'Illustration',
                // height: Get.height / 2.5,
                // color: Colors.cyan,
              ),
              Text(
                'Lets Get Started',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text(
                'Place your first link into \nthe field to shorten it',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal, fontSize: 14),
              ),
              Stack(
                children: [
                  Container(
                      // width: Get.width,
                      child: SvgPicture.asset(
                    'assets/images/shape.svg',
                    width: Get.width,
                  )),
                  Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width / 1.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5)),
                              child: GetBuilder(
                                  builder: (MainscreenController controller) {
                                return TextFormField(
                                  onChanged: (v) {
                                    controller.valid.value = true;
                                    controller.update();
                                  },
                                  controller: controller.linkctrl,
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: controller.valid.value
                                              ? Colors.black45
                                              : Colors.red.shade400),
                                      hintText: controller.valid.value
                                          ? controller.label
                                          : controller.errortext),
                                  textAlign: TextAlign.center,
                                );
                              }),
                              // color: Colors.white,
                            ),
                            Container(
                              width: Get.width / 1.5,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (controller.validate()) {
                                    // printInfo(

                                    // Uri uri = Uri.parse(
                                    //     'https://api.shrtco.de/v2/shorten?url=https://docs.flutter.dev/cookbook/networking/fetch-data');
                                    // ShortModel data =
                                    Result r = await controller.fetchdata(Uri.parse(
                                        'https://api.shrtco.de/v2/shorten?url=${controller.linkctrl.text}'));

                                    controller.adddatatopreferences(r);
                                    Get.to(ResultScreen());

                                    // printInfo(info: 'data' + data.toString());
                                  }
                                },
                                child: Text('Shorten'),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
