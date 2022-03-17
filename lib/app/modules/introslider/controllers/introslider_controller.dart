import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomViewModel extends StatelessWidget {
  CustomViewModel(
      {Key? key, required this.asset, required this.desc, required this.title})
      : super(key: key);
  String asset;
  String title;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: Get.height - 100,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 40,
          // ),
          CircleAvatar(
            child: SvgPicture.asset(asset),
            backgroundColor: Colors.blue,
            radius: 40,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 20,
              // color: Colors.BL
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                // color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntrosliderController extends GetxController {
  List<CustomViewModel> listofpages = [
    CustomViewModel(
        title: "Brand Recognition",
        desc:
            "Boost your brand recognition\n with each click. Generic links\n don't mean a thing. Branded\n links helps instill confidence in\n your content",
        asset: 'assets/images/diagram.svg'),
    CustomViewModel(
        title: "Detailed Records",
        desc:
            "Boost your brand recognition with each click. Generic links don't mean a thing. Branded links helps instill confidence in your content",
        asset: 'assets/images/Gauge.svg'),
    CustomViewModel(
        title: "Brand Recognition",
        desc:
            "Boost your brand recognition with each click. Generic links don't mean a thing. Branded links helps instill confidence in your content",
        asset: 'assets/images/tools.svg'),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
