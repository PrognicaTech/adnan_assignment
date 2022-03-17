import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urlshortener/app/data/constants.dart';
// import 'package:urlshortener/app/data/constants.dart';
import 'package:urlshortener/app/data/shortmodel.dart';
import 'package:urlshortener/app/modules/mainscreen/service.dart';

class MainscreenController extends GetxController {
  deletefromresult(int i) {
    results.removeAt(i);

    btnColor.removeAt(i);
    btnColor.refresh();
    results.refresh();
    update();
    // datacount.write('result', )
    String encodedData = Result.encode(results.value);
    datacount.write('results', encodedData);
    onInit();
  }

  final String _label = 'Shorten a link here!';
  get label => _label;
  RxList<Result> results = <Result>[].obs;
  RxList<Color> btnColor = <Color>[].obs;
  final String _errortext = "Please Add a link here";
  get errortext => _errortext;
  RxBool valid = true.obs;
  TextEditingController linkctrl = TextEditingController();
  Rx<Result> r = Result(
          shortLink3: '',
          shortLink: '',
          originalLink: '',
          code: '',
          shareLink: '',
          shortLink2: '',
          fullShareLink: '',
          fullShortLink2: '',
          fullShortLink3: '',
          fullShortLink: '')
      .obs;

  @override
  void onInit() async {
    super.onInit();
    final map = await datacount.read('results') ?? {};
    results.value = Result.decode(map);
    btnColor.value.addAll(List.generate(results.length + 2, (index) {
      return Colors.cyan;
    }));
    printInfo(
        info:
            "lengths" + results.length.toString() + btnColor.length.toString());
    // results.value = await datacount.read('result') ?? {};
  }

  Future<Result> fetchdata(Uri uri) async {
    r.value = await HttpServ.fetchshortmodel(uri);
    return r.value;
  }

  void adddatatopreferences(Result r) {
    if (r.toString().isNotEmpty) {
      results.value.add(r);
      results.refresh();

      String encodedData = Result.encode(results.value);
      datacount.write('results', encodedData);
    }

    // Map<String , dynamic> m= results.forEach((element) { })
    // datacount.write('result', results.forEach((element) {
    //   element.toJson();
    // }));
  }

  void copytoClipboard(int index) {
    FlutterClipboard.copy(results[index].shortLink).then((value) {
      btnColor[index] = Colors.blue;
      btnColor.refresh();
      update();
      Get.snackbar('Copied', "Successfully Copied");
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool validate() {
    if (linkctrl.text.isEmpty || linkctrl.text == null) {
      valid.value = false;
      update();
      return false;
    } else {
      valid.value = true;
      update();
      return true;
    }
  }

  @override
  void onClose() {}
}
