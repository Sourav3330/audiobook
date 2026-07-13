import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  RxInt currentindex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/icon/app_logo.png'),
            ),
            SizedBox(height: 290,),
            SizedBox( child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
