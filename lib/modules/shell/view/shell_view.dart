import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/app/theme/fonts.dart';
import 'package:audio_book/common%20widget/common_network_Image.dart';
import 'package:audio_book/common%20widget/common_slider.dart';
import 'package:audio_book/common%20widget/mini_player.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/modules/activity/view/activity_view.dart';
import 'package:audio_book/modules/discover/view/discover_view.dart';
import 'package:audio_book/modules/library/view/library_view.dart';
import 'package:audio_book/modules/profile/view/profile_view.dart';
import 'package:audio_book/modules/shell/controller/shell_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/durationFormater.dart';

class ShellView extends GetView<ShellController> {
  final List<Widget> pages = [
    DiscoverView(),
    LibraryView(),
    ActivityView(),
    ProfileView(),
  ];

  ShellView({super.key});
  @override
  Widget build(BuildContext context) {
    print("DiscoverView build@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child:
              Obx(()=>
                 IndexedStack(
                  index: controller.currentIndex.value,
                  children: pages,
                ),
              ),
            ),
            Obx(()=>
            controller.player.currentBook.value == null
                ? SizedBox()
                : InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.player);
              },
                  child:MiniPlayer(),
                ),
            )
          ],
        ),
        bottomNavigationBar:
        Obx(()=>
            NavigationBar(
              indicatorColor: Colors.transparent,
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                return TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                );
              }),
              height: AppSizes.bottomNavHeight,
              selectedIndex: controller.currentIndex.value,
              onDestinationSelected: (value) {
                controller.changeIndex(value);
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_filled),
                  label: 'Discover',
                ),
                NavigationDestination(
                  icon: Icon(Icons.local_library_outlined),
                  label: 'library',
                ),
                NavigationDestination(
                  icon: Icon(Icons.library_books),
                  label: 'Activity',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ),
          ),
    );
  }
}
