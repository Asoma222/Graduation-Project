import 'package:flutter/material.dart';

class Details_Screen2 extends StatefulWidget {
  late String id;
  late String arName;
  late String price;
  late String usage;
  late String effectiveMaterial;
  late String categoryName;
  Details_Screen2(id, arName, price, usage, effectiveMaterial, categoryName) {
    this.id = id;
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
    return Scaffold(
        appBar: AppBar(
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
                  padding: const EdgeInsets.only(
                    top: 56,
                  ),
                  child: Container(
                      width: 200,
                      height: 200,
                      child: const Image(
                        image: NetworkImage(
                            "data:image/jpeg;base64,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"),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.price,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 3, 112, 43)),
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          "انتاج :Amiray",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 7, 1, 114)),
                          textDirection: TextDirection.rtl,
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
                        padding: EdgeInsets.only(right: 20),
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
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 50,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "الا ثار الجانبيه",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
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
                          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    )),
              ], // Biggest column
            ),
          ),
        ));
  }
}
