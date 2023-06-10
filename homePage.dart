import 'package:flutter/material.dart';
import 'package:project/Screens/HomeScreen.dart';
import 'package:project/Screens/SearchUser.dart';
import 'package:project/Widgets/CategoriesWidgets.dart';
import 'package:project/Widgets/HomeAppBar.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 1;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            //temprory highet
            //height: 500,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 222, 225, 226),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: (Column(
              children: [
                //search widgets
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        size: 27,
                        color: Color.fromARGB(255, 54, 57, 244),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 50,
                        width: 150,
                        child: TextFormField(
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "بحث علي دواء",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: SearchUser(),
                                    query: "");
                              },
                              icon: Icon(Icons.search_sharp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //categories
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: const Text(
                    "categories",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                CategoriesWidgets(),
                HomeView(),
              ],
            )),
          )
        ],
      ),
    );
  }
}
