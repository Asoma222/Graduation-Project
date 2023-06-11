import 'package:flutter/material.dart';

class Details_Screen2 extends StatefulWidget {
  late String id;
  late String image;
  late String arName;
  late String price;
  late String usage;
  late String effectiveMaterial;
  late String categoryName;

  Details_Screen2(
      id, image, arName, price, usage, effectiveMaterial, categoryName) {
    this.id = id;
    this.image = image;
    this.arName = arName;
    this.price = price;
    this.usage = usage;
    this.effectiveMaterial = effectiveMaterial;
    this.categoryName = categoryName;
  }
  @override
  State<Details_Screen2> createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<Details_Screen2> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double screenWidthInPixels =
        screenWidth * MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          iconTheme: IconThemeData(
            color: Colors
                .black, // Set the color of all icons in the app bar to black
          ),
          backgroundColor: Colors.white,
          title: Text(widget.id.toString()),
        ),
        body: SafeArea(
          child: Container(
            //color: Colors.red,
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 56,
                  ),
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image(
                        image: NetworkImage(widget.image.toString()),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(widget.arName,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            widget.price,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 3, 112, 43)),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: (180)),
                          child: Text(
                            "انتاج :Amiray",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 7, 1, 114)),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "تفاصيل المنتج ",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 1, 114)),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 50,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          widget.usage,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "الماده الفاعله ",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 1, 114)),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 50,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          widget.effectiveMaterial,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "الاستخدام",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 1, 114)),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 50,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          widget.categoryName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                ),
              ], // Biggest column
            ),
          ),
        ));
  }
}
