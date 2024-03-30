import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  myTimer(){
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed(MyRoutes.home);
    });
  }
  @override
  void initState() {
    super.initState();
    myTimer();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(padding: EdgeInsets.all(16),child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("https://openai.com/social/facebook.png",width: 600,),
          SizedBox(height: 30,),
          CircularProgressIndicator(color: Colors.white,),
        ],
      )),),
    );
  }
}
