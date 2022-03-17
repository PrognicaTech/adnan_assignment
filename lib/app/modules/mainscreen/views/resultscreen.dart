import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urlshortener/app/modules/mainscreen/controllers/mainscreen_controller.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);
  var ctrl = Get.find<MainscreenController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 0,
          title: Center(
              child: Text(
            'Your Link History',
            style: TextStyle(fontSize: 17, color: Colors.black),
          )),
          automaticallyImplyLeading: false,
        ),
        body: Scaffold(
          // appBar: AppBar(),
          body:
              // Text('Your Link History'),
              GetX(
            builder: (MainscreenController ctrl) => ListView.builder(
                itemCount: ctrl.results.length,
                itemBuilder: (c, i) {
                  // var width = Get.width;
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      elevation: 0,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Text(
                                    ctrl.results.value[i].originalLink,
                                    style: GoogleFonts.poppins(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    ctrl.deletefromresult(i);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/del.svg',
                                    height: 30,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Container(
                                height: 1,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ctrl.results[i].fullShortLink,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.cyan),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GetBuilder(builder: (MainscreenController c) {
                              return ElevatedButton(
                                  onPressed: () {
                                    ctrl.copytoClipboard(i);
                                  },
                                  child: c.btnColor.value[i] == Colors.cyan
                                      ? Text('Copy')
                                      : Text('Copied'),
                                  style: ElevatedButton.styleFrom(
                                      primary: c.btnColor[i]));
                            })
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
