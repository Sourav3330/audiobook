import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/helpers/durationFormater.dart';
import 'package:audio_book/modules/activity/controller/activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common widget/common_network_Image.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize:Size.fromHeight(kToolbarHeight), child:
          Obx((){
            return
      controller.selectionMode.value ?
      AppBar(
        leading: IconButton(onPressed: (){
          controller.selectionMode.value = false;
        }, icon:Icon(Icons.close)),
        title: Text(controller.deleteList.length.toString()),
        actions: [
          IconButton(onPressed: (){controller.deleteSelected();}, icon: Icon(Icons.delete))
        ],
      ):
        CommonAppbar(showBackButton: false);
          }),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Device Storage",
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: AppSpacing.md),
                        Obx(
                          () => Text(
                            "${controller.usedStorage.value.toStringAsFixed(1)} "
                            "GB of ${controller.totalStorage.value.toStringAsFixed(1)} GB is used",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Obx(
                          () => LinearProgressIndicator(
                            minHeight: 10,
                            borderRadius: BorderRadius.circular(30),
                            value:
                                controller.usedStorage.value /
                                controller.totalStorage.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Text("Your Downloads"),
                  Spacer(),
                  TextButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    onPressed: () {
                      controller.toggleSelection();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Text(
                        'Select',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.sm),
              Obx(
                () => ListView.builder(
                  physics: ScrollPhysics(parent: ScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: controller.allDownloads.length,
                  itemBuilder: (context, index) {
                    var data = controller.allDownloads[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 70,
                                child: CommonNetworkImage(imageUrl: data.cover),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 220,
                                    child: Text(
                                      data.title,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    data.author,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    Durationformater.getDurationText(
                                      data.duration,
                                    ),
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(color: AppColors.gray800),
                                  ),
                                ],
                              ),
                              const Spacer(),
                             Obx(()=>
                                SizedBox (
                                 child:
                                 controller.selectionMode.value
                                    ? Checkbox(value: controller.deleteList.contains(data.id), onChanged: (value) {controller.removeOrAddFromSelection(data.id);})
                                    :
                                      IconButton(
                                          onPressed: () {
                                            controller.deleteDownloads(data.id);
                                          },
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                          ),

                                    ),),
                             )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
