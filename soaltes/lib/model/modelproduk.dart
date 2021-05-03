// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

import 'dart:convert';

Produk produkFromJson(String str) => Produk.fromJson(json.decode(str));

String produkToJson(Produk data) => json.encode(data.toJson());

class Produk {
  Produk({
    this.data,
  });

  List<Datum> data;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.itemCode,
    this.itemName,
    this.image,
    this.normalRate,
    this.promoRate,
  });

  String itemCode;
  String itemName;
  String image;
  double normalRate;
  double promoRate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    itemCode: json["item_code"],
    itemName: json["item_name"],
    image: json["image"] == null ? null : json["image"],
    normalRate: json["normal_rate"],
    promoRate: json["promo_rate"],
  );

  Map<String, dynamic> toJson() => {
    "item_code": itemCode,
    "item_name": itemName,
    "image": image == null ? null : image,
    "normal_rate": normalRate,
    "promo_rate": promoRate,
  };
}
