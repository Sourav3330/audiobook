import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/common%20widget/vertical_bookcard.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/modules/library/controller/cate_data_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CateDataView extends GetView<CateDataController> {
  const CateDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: CustomScrollView(
          slivers: [
            // SliverAppBar(
            //   backgroundColor: AppColors.scaffoldBg,
            //   title:Text( controller.category.name,style: TextStyle(color: AppColors.primary),),
            //   pinned: true,
            //   automaticallyImplyLeading: false,
            // ),
            // SliverAppBar(
            //   automaticallyImplyLeading: false,
            //   flexibleSpace: Text(controller.category.description),
            //   expandedHeight: 180,
            // ),

            SliverToBoxAdapter(
              child: Text(
                controller.category.name,
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                controller.category.description,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grayText,
                  fontSize: 15,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10,),),

            SliverGrid.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                childAspectRatio: 0.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
                crossAxisCount: 2), itemCount: controller.books.length,itemBuilder: (context,index){
              var data = controller.books[index];
              return InkWell(
                  onTap:(){
                    controller.navigateToViewBook(data);
                  },
                  child: VerticalBookCard(book:data,));
            })
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(9),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         controller.category.name,
      //         style: TextStyle(
      //           fontSize: 25,
      //           color: AppColors.primary,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //       Text(
      //         controller.category.description,
      //         style: TextStyle(
      //           fontWeight: FontWeight.w500,
      //           color: AppColors.grayText,
      //           fontSize: 15,
      //         ),
      //       ),
      //       Expanded(
      //         child: GridView.builder(
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             // crossAxisSpacing: 4,
      //             // mainAxisSpacing: 9,
      //             // childAspectRatio: 0.6,
      //           ),
      //           itemCount: controller.books.length,
      //           itemBuilder: (context, index) {
      //             var data = controller.books[index];
      //             final width = (MediaQuery.of(context).size.width) / 2;
      //             return VerticalBookCard(book: data, width: width);
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
