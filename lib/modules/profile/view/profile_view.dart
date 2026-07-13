import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            controller.logout();
          },
          child: Text('Profile'),
        ),
      ),
    );
  }
}
