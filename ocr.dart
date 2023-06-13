import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:project/Screens/SearchUser.dart';

class Ocr extends StatefulWidget {
  @override
  _OcrState createState() => _OcrState();
}

class _OcrState extends State<Ocr> {
  XFile? image;
  String? result;
  final ImagePicker picker = ImagePicker();
  String? result2;
  String? result3;

  //we can upload image from camera or from gallery based on parameter

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
    result = null;
  }

  Future<void> UploadFile() async {
    var dio = Dio();
    File file = File(image!.path);

    FormData data =
        FormData.fromMap({"file": await MultipartFile.fromFile(file.path)});

    var response = await dio.post("http://127.0.0.1:8000/images/", data: data);
    // debugPrint(response.data.toString());
    result = response.data.toString();

    // RegExp exp = RegExp(r'\[([^\]]*)\]');
    // RegExpMatch? match = exp.firstMatch(result!);
    // if (match != null) {
    //   String? result2 = match.group(1);
    //   print(result2); // prints "variable"
    // }

    setState(() {
      RegExp exp = RegExp(r'\[([^\]]*)\]');
      RegExpMatch? match = exp.firstMatch(result!);
      if (match != null) {
        String? result2 = match.group(1);
        print(result2);
        result3 = result2; // prints "variable"
      }
    });
    print(response.data.toString());
    print(result2);
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                myAlert();
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('get Photo'),
            ),
            SizedBox(
              height: 10,
            ),
            //if image not null show the image
            //if image null show text
            image != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(image!.path),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    ),
                  )
                : Text(
                    "No Image",
                    style: TextStyle(fontSize: 20),
                  ),
            ElevatedButton(
              onPressed: () {
                UploadFile();
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('upload Image'),
            ),
            SizedBox(
              height: 20,
            ),
            result3 == null || image == null
                ? Text("no Result", style: TextStyle(fontSize: 50))
                : Text(
                    result3!,
                    style: TextStyle(fontSize: 50),
                  ),
            Container(
              child: Center(
                child: IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: SearchUser(),
                        query: result3);
                  },
                  icon: Icon(Icons.search_sharp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
