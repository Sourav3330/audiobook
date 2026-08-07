import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PushNotificationController extends GetxController{
  RxBool getNotifications = false.obs;

  void changePermission(){
    getNotifications.value = !getNotifications.value;
  }

  Future<void>requestPermission(bool value)async{
    if(!value){
      getNotifications.value=false;
      return;
    }
    final permission = await Permission.notification.request();
    if (permission.isGranted){
      getNotifications.value = true;
      // Subscribe to topics or enable notifications
    }
    else{
      getNotifications.value = false;
      // Unsubscribe from topics
      // Cancel scheduled local notifications
    }
  }
}