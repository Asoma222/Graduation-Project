import 'package:flutter/material.dart';

import '../finalChatbot.dart';
import '../ocr.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Badge(
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(7),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FChatBot()));
              },
              child: Icon(
                Icons.chat,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 50)),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 8, right: 15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 176, 27),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ocr()));
                  },
                  child: Text(
                    "بحث بالعلبة",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.medical_information,
            size: 30,
            color: Color.fromARGB(249, 7, 179, 62),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0),
          ),
          Image.asset(
            "images/11.png",
            height: 55,
            width: 55,
          ),
        ],
      ),
    );
  }
}
