import 'package:flutter/material.dart';

class CategoriesWidgets extends StatelessWidget {
  List catlist = [
    "All",
    "عناية شخصيه",
    "عناية بالشعر",
    "عناية بالبشرة",
    "عروض مميزة",
  ];
  List imgeList = [
    "0"
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < catlist.length; i++)
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: catlist[i] == "All"
                      ? Color.fromARGB(249, 7, 179, 62)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  catlist[i],
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 33, 51, 243)),
                )),
        ],
      ),
    );
  }
}
