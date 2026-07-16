import 'package:audio_book/common%20widget/commonSearchField.dart';
import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/modules/library/controller/library_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            children: [
              CommonSearchField(hint: AppStrings.searchCategory),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 9,
                      mainAxisSpacing: 9,
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      var data = controller.categories[index];
                      return
                        InkWell(
                          onTap: (){
                            controller.navigateToCategoryData(data);
                          },
                          child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  data.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black12,
                                      Colors.black54,
                                      Colors.black87,
                                    ],
                                    stops: [
                                      0.0,
                                      0.5,
                                      0.8,
                                      1.0,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 145,
                                left: 15,
                                child: Text(
                                  data.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: AppColors.categoryTextColor
                                  ),
                                ),
                              ),
                            ],
                          ),
                                                ),
                        );
                    },
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
