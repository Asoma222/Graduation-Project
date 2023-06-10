import 'dart:typed_data';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  List<int>? _SelectedFile;
  Uint8List? _byteData;
  late String FileName;
  dynamic answer;
  int? check_new_photo;

  startWebFilePicker() async {
    check_new_photo = null;
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        setState(() {
          FileName = file.name;
          _byteData =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          _SelectedFile = _byteData;
        });
      });
      reader.readAsDataUrl(file);
    });
    check_new_photo = null;
  }

  Future uploadImageToServer() async {
    var url = Uri.parse("http://127.0.0.1:8000/images/");
    var request = http.MultipartRequest("POST", url);
    request.files.add(await http.MultipartFile.fromBytes('file', _SelectedFile!,
        contentType: MediaType('application', 'json'), filename: FileName));
    request.send().then((response) async {
      if (response.statusCode == 200) {
        print("File upload sucessfuly");
      } else {
        print("File upload failed");
      }
      final stream = response.stream;
      final json =
          await stream.transform(utf8.decoder).transform(JsonDecoder()).first;
      setState(() {
        answer = json;
        check_new_photo = 1;
      });
    });
    // Dio dio = new Dio();
    // FormData formData = FormData.fromMap({
    //   "file": MultipartFile.fromBytes(
    //     _SelectedFile!,
    //     filename: FileName,
    //     contentType: MediaType("application", "json"),
    //   )
    // });
    // var response =
    //     await dio.post("http://127.0.0.1:8000/images/", data: formData);
    // setState(() {
    //   answer = response.data.toString();
    // });

    //return response.data.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Column(
        children: [
          const Text("let's upload image "),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.blue,
            elevation: 8,
            highlightElevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const Text("Select Photo"),
            onPressed: startWebFilePicker,
            //onPressed:
          ),
          const Divider(color: Colors.teal),
          _byteData != null
              ? Image.memory(_byteData!, width: 200, height: 200)
              : Container(),
          MaterialButton(
            color: Colors.blueAccent,
            elevation: 8,
            highlightElevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const Text("upload to server"),
            onPressed: uploadImageToServer,

            //onPressed:
          ),
          check_new_photo == null
              ? const Text("there's no answer")
              : Text(answer!)
        ],
      )),
    ));
  }
}
