// To parse this JSON data, do
//
//     final shortModel = shortModelFromJson(jsonString);

import 'dart:convert';

ShortModel shortModelFromJson(String str) =>
    ShortModel.fromJson(json.decode(str));

String shortModelToJson(ShortModel data) => json.encode(data.toJson());

class ShortModel {
  ShortModel({
    required this.ok,
    required this.result,
  });

  bool ok;
  Result result;

  factory ShortModel.fromJson(Map<String, dynamic> json) => ShortModel(
        ok: json["ok"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": Result.toJson(result),
      };
}

class Result {
  Result({
    required this.code,
    required this.shortLink,
    required this.fullShortLink,
    required this.shortLink2,
    required this.fullShortLink2,
    required this.shortLink3,
    required this.fullShortLink3,
    required this.shareLink,
    required this.fullShareLink,
    required this.originalLink,
  });

  String code;
  String shortLink;
  String fullShortLink;
  String shortLink2;
  String fullShortLink2;
  String shortLink3;
  String fullShortLink3;
  String shareLink;
  String fullShareLink;
  String originalLink;
  @override
  String toString() {
    return "$shortLink$originalLink}";
  }

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["code"],
        shortLink: json["short_link"],
        fullShortLink: json["full_short_link"],
        shortLink2: json["short_link2"],
        fullShortLink2: json["full_short_link2"],
        shortLink3: json["short_link3"],
        fullShortLink3: json["full_short_link3"],
        shareLink: json["share_link"],
        fullShareLink: json["full_share_link"],
        originalLink: json["original_link"],
      );

  static Map<String, dynamic> toJson(Result r) => {
        "code": r.code,
        "short_link": r.shortLink,
        "full_short_link": r.fullShortLink,
        "short_link2": r.shortLink2,
        "full_short_link2": r.fullShortLink2,
        "short_link3": r.shortLink3,
        "full_short_link3": r.fullShortLink3,
        "share_link": r.shareLink,
        "full_share_link": r.fullShareLink,
        "original_link": r.originalLink,
      };
  static String encode(List<Result> results) => json.encode(
        results
            .map<Map<String, dynamic>>((result) => Result.toJson(result))
            .toList(),
      );

  static List<Result> decode(String results) =>
      (json.decode(results) as List<dynamic>)
          .map<Result>((item) => Result.fromJson(item))
          .toList();
}
