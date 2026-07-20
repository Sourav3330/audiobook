import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/app/theme/fonts.dart';
import 'package:audio_book/common%20widget/common_slider.dart';
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
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: controller.currentIndex.value,
                children: pages,
              ),
            ),
            controller.player.currentBook.value == null
                ? SizedBox()
                : InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.player);
              },
                  child: Card(
                      color: AppColors.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          // minLeadingWidth: 60,
                          // minTileHeight: 80,
                          leading: SizedBox(
                            height: 56,width: 56,
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                controller.player.currentBook.value!.cover,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            controller.player.currentChapter.value!.title,
                            style: TextStyle(color: AppColors.surface,fontFamily: Fonts.poppins),
                          ),
                          subtitle:
                          SizedBox(
                            width: 150,
                            child: Row(
                              children: [
                                CommonSlider(
                                    miniPlayer: true,
                                    value: controller.player.position.value.inSeconds.toDouble(), max: controller.player.duration.value.inSeconds.toDouble()
                                    , onChanged:(value){
                                  controller.player.seek(Duration(seconds: value.toInt()));
                                    }),
                                SizedBox(width: 9,),
                                Text(
                                  Durationformater.formatDuration(
                                    controller.player.position.value,
                                  ),
                                  style: TextStyle(fontFamily: Fonts.poppins, fontSize: 12,color: AppColors.miniPlayerDuration),
                                ),
                                Text('/'),
                                Text(
                                  Durationformater.formatDuration(
                                    controller.player.duration.value,
                                  ),
                                  style: TextStyle(fontFamily: Fonts.poppins, fontSize: 12,color: AppColors.miniPlayerDuration),
                                ),
                              ],


                            ),
                          ),
                        ),
                      ),
                    ),
                ),
          ],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,

            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: AppColors.primary, size: 28);
              }
              return const IconThemeData(color: Colors.grey, size: 24);
            }),
          ),
          child: NavigationBar(
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
      ),
    );
  }
}
