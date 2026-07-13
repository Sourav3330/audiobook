import 'package:audio_book/modules/auth/services/auth_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
final AuthService auth = AuthService();
Future<void>logout()async
{
 await auth.signOut();
}}