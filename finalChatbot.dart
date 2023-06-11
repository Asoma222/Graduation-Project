import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import "dart:convert";
import "dart:async";
import 'package:http/http.dart' as http;

class FChatBot extends StatefulWidget {
  const FChatBot({super.key});

  @override
  State<FChatBot> createState() => _FChatBotState();
}

class _FChatBotState extends State<FChatBot> {
  TextEditingController _textEditingController = TextEditingController();
  List<Map<String, dynamic>> _chatMessages = [];
  int count = 1;

  // }
  int chat_index = 0;
  FocusNode _focusNode = FocusNode();
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(238, 238, 238, 1.0),
      child: SafeArea(
          minimum: EdgeInsets.only(
            top: MediaQuery.of(context).size.width / 4,
          ),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(children: [
                Expanded(
                    flex: 10,
                    child: Container(
                      child: ListView.builder(
                        itemCount: _chatMessages.length,
                        itemBuilder: (context, int index) {
                          if (_chatMessages[index]["chat_index"] == 0) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, bottom: 5),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width /
                                              2),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 185, 255, 1.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 15,
                                        left: 15),
                                    child: Text(_chatMessages[index]['text'],
                                        style: TextStyle(
                                            color: Colors.white, height: 1.5)),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "images/bot-svgrepo-com.png",
                                      width: 25,
                                      height: 25,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(18, 31, 51, 1.0),
                                        borderRadius: BorderRadius.circular(
                                            10), // here we changed as like like the server
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(7),
                                        child: Text(
                                            _chatMessages[index]['text'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                height: 1.5)),
                                      ),
                                    ) // Delete this semicolon when you delete this layoutbuilder
                                    // here we will put semicolon
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    )), // here we ill put the ListView.builder
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Color.fromRGBO(43, 43, 43, 1),
                              hintText: 'Type a message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: -45,
                          child: IconButton(
                              icon: Icon(Icons.send),
                              color: Color.fromRGBO(0, 185, 255, 1.0),
                              onPressed: () async {
                                try {
                                  if (_textEditingController.text.isEmpty) {
                                    // if itdoesn't work well delete count =0 from the condition
                                    // Do nothing
                                  } else {
                                    count = 0;
                                    String message =
                                        _textEditingController.text;
                                    setState(() {
                                      _chatMessages.add({
                                        "text": message,
                                        "chat_index": 0
                                      }); // Add a Map object with "text" and "chat_index" keys and their corresponding values
                                      _textEditingController.clear();
                                    });
                                    final url = Uri.parse(
                                        "http://localhost:5005/webhooks/rest/webhook");
                                    final response = await http.post(url,
                                        headers: {
                                          'Content-Type': 'application/json'
                                        },
                                        body: jsonEncode({
                                          "sender": "khaled",
                                          "message": message
                                        }));
                                    if (response.statusCode == 200) {
                                      String reply =
                                          jsonDecode(response.body)[0]['text'];
                                      print(reply);
                                      setState(() {
                                        _chatMessages.add({
                                          "text": reply,
                                          "chat_index": 1
                                        }); // Add a Map object with "text" and "chat_index" keys and their corresponding values
                                      });
                                    }
                                    count = 1; // delete it if there's problem
                                  }
                                } catch (e) {
                                  setState(() {
                                    _chatMessages.add({
                                      "text": "there's no Ai work",
                                      "chat_index": 1
                                    });
                                  });
                                }
                                // if (_textEditingController.text.isEmpty) {
                                //   // if itdoesn't work well delete count =0 from the condition
                                //   // Do nothing
                                // } else {
                                //   count = 0;
                                //   String message = _textEditingController.text;
                                //   setState(() {
                                //     _chatMessages.add({
                                //       "text": message,
                                //       "chat_index": 0
                                //     }); // Add a Map object with "text" and "chat_index" keys and their corresponding values
                                //     _textEditingController.clear();
                                //   });
                                //   final url = Uri.parse(
                                //       "http://localhost:5005/webhooks/rest/webhook");
                                //   final response = await http.post(url,
                                //       headers: {
                                //         'Content-Type': 'application/json'
                                //       },
                                //       body: jsonEncode({
                                //         "sender": "khaled",
                                //         "message": message
                                //       }));
                                //   if (response.statusCode == 200) {
                                //     String reply =
                                //         jsonDecode(response.body)[0]['text'];
                                //     print(reply);
                                //     setState(() {
                                //       _chatMessages.add({
                                //         "text": reply,
                                //         "chat_index": 1
                                //       }); // Add a Map object with "text" and "chat_index" keys and their corresponding values
                                //     });
                                //   }
                                //   count = 1; // delete it if there's problem
                                // }
                              }),
                        )
                      ]),
                    ))
              ]))),
    ));
  }

  void _onFocusChange() {
    // we should understand it to
    if (!_focusNode.hasFocus) {
      // Update the text controller when the TextField loses focus
      setState(() {});
    }
  }

  @override
  void dispose() {
    // we should understand it
    _textEditingController.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }
}
// Row(
//                                     children: [
//                                       Image.asset(
//                                         "images/bot-svgrepo-com.png",
//                                         width: 25,
//                                         height: 25,
//                                       ),
//                                       Container(
//                                         constraints: BoxConstraints(
//                                             maxWidth: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 2),
//                                         decoration: BoxDecoration(
//                                           color:
//                                               Color.fromRGBO(18, 31, 51, 1.0),
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(5),
//                                           child: Text(
//                                               _chatMessages[index]['text'],
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   height: 1.5)),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
