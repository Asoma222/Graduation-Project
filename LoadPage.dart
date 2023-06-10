import 'package:flutter/material.dart';

class HOME extends StatefulWidget {
  final int duration;
  const HOME({super.key, required this.duration});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  bool _isIndicatorActive = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: widget.duration), () {
      setState(() {
        _isIndicatorActive = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return _isIndicatorActive
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Text("hi osama");
  }
}
