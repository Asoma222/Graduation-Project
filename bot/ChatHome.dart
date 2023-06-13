import 'package:flutter/material.dart';
import 'package:project/finalChatbot.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  bool _isIndicatorActive = true;
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isIndicatorActive = false;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FChatBot()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Hello,I am Your Medical Assistant",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Image.asset("images/logobot.png", width: 200),
          SizedBox(
            height: 50,
          ),
          if (_isIndicatorActive)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    ));
  }
}
