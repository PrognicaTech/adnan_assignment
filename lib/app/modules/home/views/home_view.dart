import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urlshortener/app/modules/introslider/views/introslider_view.dart';
import 'package:urlshortener/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
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
                  'More than just\n shorter links',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Build your brand's recognition and\n get detailed insight on how your\n links are performing",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: Get.width / 1.5,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offNamed(Routes.INTROSLIDER);
                      },
                      child: Text(
                        'START',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
