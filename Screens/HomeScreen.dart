import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/Models/user_model.dart';
import 'package:project/details.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int page = 1;
  List<Result> albums = [];
  var body;
  bool isloadMore = true;
  void inistate() {
    super.initState();

    ScrollController scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isloadMore = false;
        });

        page = page + 1;
        fetchData();
        setState(() {
          isloadMore = false;
        });
      }
    });
  }

  Future<List<Result>?> fetchData({String? query}) async {
    http.Response response = await http.get(
        Uri.parse("http://localhost:8001/mediceines_api/medicine/?page=$page"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptCharsetHeader: 'utf-8',
        });
    if (response.statusCode == 200) {
      body = (json.decode(utf8.decode(response.bodyBytes)))['results'];

      for (var item in body) {
        albums.add(Result.fromJson(item));

        if (query != null) {
          albums = albums
              .where((element) =>
                  element.arName.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
      }
      setState(() {
        body;
        isloadMore = false;
        page = page + 1;
      });
      return albums;
    }

    return fetchData();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    final orientation = MediaQuery.of(context).orientation;
    return SingleChildScrollView(
        child: GridView.count(
            childAspectRatio: 0.4,
            crossAxisCount: 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
          Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FutureBuilder<List<Result>?>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {}
                    List<Result>? data = snapshot.data;
                    return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.5,
                            ),
                            itemCount: data?.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 2),
                                    child: Image.network(
                                        '${data?[index].image}'), //Image.network('${data?[index].image}'),
                                    height: 70,
                                    width: 70,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '${data?[index].arName}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 75, 33, 243)),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'جنيه ${data?[index].price}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10, top: 2),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 7, 176, 27),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Details_Screen2(
                                                        '${data?[index].id}',
                                                        '${data?[index].image}',
                                                        '${data?[index].arName}',
                                                        '${data?[index].price}',
                                                        '${data?[index].usage}',
                                                        '${data?[index].effectiveMaterial}',
                                                        '${data?[index].categoryName}')),
                                              );
                                            },
                                            child: Text(
                                              "تفاصيل",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }));
                  }))
        ]));
  }
}
