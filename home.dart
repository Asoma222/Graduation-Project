import 'package:flutter/material.dart';
import 'package:project/homePage.dart';

class Home_ extends StatefulWidget {
  const Home_({Key? key});

  @override
  State<Home_> createState() => _Home_State();
}

class _Home_State extends State<Home_> {
  bool _isIndicatorActive = true;

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isIndicatorActive = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final currentRoute = ModalRoute.of(context);

        if (currentRoute?.settings.name == '/') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        }
        return true;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/دواء.jpeg", width: 200),
              SizedBox(
                height: 50,
              ),
              if (_isIndicatorActive)
                Center(
                  child: CircularProgressIndicator(),
                ),
              Container(
                child: Text(
                  "مرحبا بك في تطبيق دواء",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





























































// class Home_ extends StatefulWidget {
//   const Home_({super.key});

//   @override
//   State<Home_> createState() => _Home_State();
// }

// class _Home_State extends State<Home_> {
//   bool _isIndicatorActive = true;
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 5), () {
//       setState(() {
//         _isIndicatorActive = false;
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => MyHomePage()));
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset("images/دواء.jpeg", width: 200),
//           SizedBox(
//             height: 50,
//           ),
//           if (_isIndicatorActive)
//             Center(
//               child: CircularProgressIndicator(),
//             ),
//           Container(
//             child: Text(
//               "مرحبا بك في تطبيق دواء",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
