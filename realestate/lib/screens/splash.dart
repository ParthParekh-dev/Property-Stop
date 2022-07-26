import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:propertystop/utils/constants.dart' as constants;
import 'package:propertystop/utils/router.dart' as router;
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String pageName = router.introPage;

  Dio dio = Dio();

  startTime() async {
    // final tokenReq = await dio.get("http://propertystop.com/");
    // var csrftoken = tokenReq.headers['set-cookie'];
    // print(csrftoken);
    final prefs = await SharedPreferences.getInstance();

    final resp = await dio.get("http://propertystop.com/");
    final csrf = resp.headers['set-cookie']?[0].split(";")[0].split("=")[1];

    bool? isLoggedIn = prefs.getBool(constants.isLoggedIn);
    if (isLoggedIn != null) {
      setState(() {
        pageName = isLoggedIn ? router.brokerMain : router.brokerMain;
      });
    } else {
      prefs.setString("csrf", csrf ?? "");
      prefs.setString("csrfCookie", resp.headers['set-cookie']?[0] ?? "");
      setState(() {
        pageName = router.brokerMain;
      });
    }

    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  navigationPage() {
    Navigator.of(context).pushReplacementNamed(pageName);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEF3238),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.jpg",
                height: 200.0,
                width: 200.0,
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Property",
                      style: TextStyle(
                        color: constants.PRIMARY_COLOR,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Stop",
                      style: TextStyle(
                        color: constants.PRIMARY_COLOR,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -20,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/splashscreenimage.png",
              height: 200.0,
              width: MediaQuery.of(context).size.width - 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
