import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:urlshortener/app/routes/app_pages.dart';

import '../controllers/introslider_controller.dart';

class IntrosliderView extends StatelessWidget {
  var controller = Get.find<IntrosliderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('IntrosliderView'),
      //   centerTitle: true,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.height / 1.5,
            child: IntroductionScreen(
              // pages: controller.listofpages,
              rawPages: controller.listofpages,
              showDoneButton: false,
              // onDone: () {},
              showNextButton: false,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Get.offNamed(Routes.MAINSCREEN);
            },
            child: Text(
              'Skip',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
