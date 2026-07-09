import 'package:get/get.dart';

import '../../auth/models/inspector_user.dart';
import '../../auth/services/auth_service.dart';

/// Loads the signed-in inspector's full profile for the Personal Information
/// screen.
class PersonalInfoController extends GetxController {
  final AuthService _authService = AuthService();

  final Rxn<InspectorUser> user = Rxn<InspectorUser>();
  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    error.value = '';
    final current = _authService.currentUser;
    if (current == null) {
      error.value = 'You are not signed in.';
      isLoading.value = false;
      return;
    }
    try {
      final fetched = await _authService.fetchInspector(current.uid);
      user.value = fetched ??
          InspectorUser(
            uid: current.uid,
            firstName: '',
            lastName: '',
            email: current.email ?? '',
          );
    } catch (_) {
      error.value = 'Could not load your profile.';
    } finally {
      isLoading.value = false;
    }
  }
}
