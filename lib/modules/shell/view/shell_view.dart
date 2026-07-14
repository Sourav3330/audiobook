import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/modules/activity/view/activity_view.dart';
import 'package:audio_book/modules/discover/view/discover_view.dart';
import 'package:audio_book/modules/library/view/library_view.dart';
import 'package:audio_book/modules/profile/view/profile_view.dart';
import 'package:audio_book/modules/shell/controller/shell_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
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
