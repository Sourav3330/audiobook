import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<bool> confirmDelete({
    required String title,
    required String description,
  }) async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: Text("Cancel"),
          ),
          FilledButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
