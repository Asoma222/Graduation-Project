import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details_Screen extends StatefulWidget {
  final int item;

  Details_Screen({Key? key, required this.item}) {}

  @override
  _Details_ScreenState createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<Details_Screen> {
  late Future<List<Episode>> episodes;

  @override
  void initState() {
    super.initState();
    episodes = fetchEpisodes(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("details")),
      body: Center(
          child: FutureBuilder(
        builder: (context, AsyncSnapshot<List<Episode>> snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                        child: Text('${snapshot.data![index].id}')),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong :('));
          }
          return CircularProgressIndicator();
        },
        future: episodes,
      )),
    );
  }

  Future<List<Episode>> fetchEpisodes(id) async {
    http.Response response = await http.get(
        Uri.parse("http://127.0.0.1:8001/mediceines_api/medicine/?id=$id/"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptCharsetHeader: 'utf-8',
        });
    if (response.statusCode == 200) {
      var body = (json.decode(utf8.decode(response.bodyBytes)))['results'];

      List<Episode> albums = [];
      for (var item in body) {
        albums.add(Episode.fromJson(item));
      }
      return albums;
    }
    return fetchEpisodes(id);
  }
}

class Episode {
  final int id;

  Episode({required this.id});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(id: json['id']);
  }
}
