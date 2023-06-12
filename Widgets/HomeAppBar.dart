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
          Padding(
              padding: EdgeInsets.only(
            right: 5,
          )),
          Center(
            child: Container(
              padding: EdgeInsets.all(7),
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
          Padding(
            padding: EdgeInsets.only(left: 10, right: 0),
          ),
          Image.asset(
            "images/11.png",
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
