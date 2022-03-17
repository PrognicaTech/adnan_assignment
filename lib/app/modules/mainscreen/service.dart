import 'dart:convert';

import 'package:http/http.dart';
import 'package:urlshortener/app/data/shortmodel.dart';

class HttpServ {
  static Future<Result> fetchshortmodel(Uri uri) async {
    Response response = await get(uri);

    var body = response.body;

    ShortModel m = ShortModel.fromJson(jsonDecode(body));
    return m.result;
  }
}
