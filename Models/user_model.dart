// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.categoryName,
    required this.company,
    required this.effectiveMaterial,
    required this.enName,
    required this.price,
    required this.usage,
    required this.arName,
  });

  int id;
  String categoryName;
  String company;
  String effectiveMaterial;
  String enName;
  double price;
  String usage;
  String arName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        categoryName: json["category_name"],
        company: json["company"],
        effectiveMaterial: json["effective_material"],
        enName: json["en_name"],
        price: json["price"]?.toDouble(),
        usage: json["usage"],
        arName: json["ar_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "company": company,
        "effective_material": effectiveMaterial,
        "en_name": enName,
        "price": price,
        "usage": usage,
        "ar_name": arName,
      };
}
