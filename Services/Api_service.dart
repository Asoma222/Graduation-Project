// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:project/Models/user_model.dart';

class FetchUserList {
  ScrollController scrollController = ScrollController();

  int page = 1;
  bool isloadMore = true;
  Future<List<Result>?> fetchData({String? query}) async {
    http.Response response = await http.get(
        Uri.parse("http://localhost:8001/mediceines_api/medicine/?page=$page"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptCharsetHeader: 'utf-8',
        });
    if (response.statusCode == 200) {
      var body = (json.decode(utf8.decode(response.bodyBytes)))['results'];

      List<Result> albums = [];
      for (var item in body) {
        albums.add(Result.fromJson(item));

        if (query != null) {
          albums = albums
              .where((element) =>
                  element.arName.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
      }

      return albums;
    }
    return fetchData();
  }
}
