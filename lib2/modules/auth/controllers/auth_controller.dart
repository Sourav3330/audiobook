import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/snackbar_utils.dart';
import '../services/auth_service.dart';

/// Shared controller backing all three auth screens (Login / Signup /
/// Registration). Holds field controllers, form keys, and the Firebase-backed
/// submit handlers.
///
/// Flow: Signup collects name/email/password and forwards to the Registration
/// form (prefilled). The Firebase account + Firestore `users/{uid}` doc (with
/// `role: 'inspector'`) are created when the Registration form is submitted.
class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  // ── Login ──────────────────────────────────────────────────────────────
  final loginKey = GlobalKey<FormState>();
  final loginCredential = TextEditingController();
  final loginPassword = TextEditingController();

  // ── Signup ─────────────────────────────────────────────────────────────
  final signupKey = GlobalKey<FormState>();
  final signupFirstName = TextEditingController();
  final signupLastName = TextEditingController();
  final signupEmail = TextEditingController();
  final signupPassword = TextEditingController();
  final signupConfirmPassword = TextEditingController();

  // ── Registration ────────────────────────────────────────────────────────
  final registrationKey = GlobalKey<FormState>();
  final regFirstName = TextEditingController();
  final regLastName = TextEditingController();
  final regPosition = TextEditingController();
  final regEmail = TextEditingController();
  final regLandline = TextEditingController();
  final regPhone = TextEditingController();
  final regCompanyName = TextEditingController();
  final regCompanyId = TextEditingController();
  final regAddress = TextEditingController();

  final Rxn<String> regState = Rxn<String>();
  final RxnString regCertFileName = RxnString();
  final RxBool agreeTerms = false.obs;

  final RxBool isLoading = false.obs;

  /// Australian states/territories for the registration dropdown.
  static const List<String> states = [
    'NSW',
    'QLD',
    'VIC',
    'NT',
    'WA',
    'ACT',
    'TAS',
  ];

  // ── Login flow ───────────────────────────────────────────────────────────
  Future<void> login() async {
    // 1. Run the form's field validators; stop if any fail.
    if (!loginKey.currentState!.validate()) return;
    // 2. Show the button spinner (the view watches `isLoading`).
    isLoading.value = true;
    try {
      // 3. Ask Firebase to sign in with the entered email + password.
      await _authService.signIn(
        email: loginCredential.text.trim(),
        password: loginPassword.text,
      );
      // 4. Success: clear the fields and replace the stack with the app shell.
      _clearAll();
      Get.offAllNamed<void>(AppRoutes.shell);
    } on AuthException catch (e) {
      // Known auth error (wrong password, no network…) — friendly message.
      SnackbarUtils.error(e.message);
    } catch (_) {
      // Anything unexpected.
      SnackbarUtils.error(AppStrings.somethingWentWrong);
    } finally {
      // 5. Always hide the spinner, success or failure.
      isLoading.value = false;
    }
  }

  void goToSignup() => Get.toNamed<void>(AppRoutes.signup);

  void forgotPassword() => SnackbarUtils.info(AppStrings.comingSoon);

  // ── Signup flow ──────────────────────────────────────────────────────────
  /// Validates the signup form, prefills the registration form, and forwards
  /// to it. The account itself is created when registration is submitted.
  void createAccount() {
    // Validate the signup form (names, email, password, confirm).
    if (!signupKey.currentState!.validate()) return;
    // Copy the signup values into the registration form's controllers so that
    // form opens pre-filled. First/last stay editable there; email is locked.
    regFirstName.text = signupFirstName.text.trim();
    regLastName.text = signupLastName.text.trim();
    regEmail.text = signupEmail.text.trim();
    // Go to the detailed registration form (account is created there).
    Get.toNamed<void>(AppRoutes.registration);
  }

  void goToLogin() {
    if (Get.previousRoute == AppRoutes.login || Get.previousRoute.isEmpty) {
      Get.back<void>();
    } else {
      Get.offAllNamed<void>(AppRoutes.login);
    }
  }

  // ── Registration flow ────────────────────────────────────────────────────
  void pickCertificate() {
    // Mock file picker — wire a real `file_picker` here later.
    regCertFileName.value = 'qualification_certificate.pdf';
  }

  /// Creates the Firebase account + Firestore inspector profile, then enters
  /// the app. Email/password come from the signup step; the editable
  /// first/last names and the rest of the form come from here.
  Future<void> submitRegistration() async {
    if (!registrationKey.currentState!.validate()) return;
    if (!agreeTerms.value) {
      SnackbarUtils.warning(AppStrings.mustAgreeTerms);
      return;
    }
    if (signupPassword.text.isEmpty) {
      // Defensive: someone reached registration without going through signup.
      SnackbarUtils.error('Please start from the signup screen.');
      Get.offAllNamed<void>(AppRoutes.signup);
      return;
    }

    isLoading.value = true;
    try {
      // Create the Firebase Auth account (email from signup + its password) and
      // write the inspector's Firestore profile in one step. `role: 'inspector'`
      // is added inside the service.
      await _authService.registerInspector(
        email: regEmail.text.trim(),
        password: signupPassword.text,
        profile: {
          'firstName': regFirstName.text.trim(),
          'lastName': regLastName.text.trim(),
          'position': regPosition.text.trim(),
          'landline': regLandline.text.trim(),
          'phone': regPhone.text.trim(),
          'companyName': regCompanyName.text.trim(),
          'companyId': regCompanyId.text.trim(),
          'state': regState.value,
          'companyAddress': regAddress.text.trim(),
        },
      );
      // Account created + user now signed in → enter the app.
      SnackbarUtils.success('Account created. Welcome aboard!');
      _clearAll();
      Get.offAllNamed<void>(AppRoutes.shell);
    } on AuthException catch (e) {
      SnackbarUtils.error(e.message);
    } catch (_) {
      SnackbarUtils.error(AppStrings.somethingWentWrong);
    } finally {
      isLoading.value = false;
    }
  }

  void cancelRegistration() => Get.back<void>();

  void goToLoginFromRegistration() => Get.offAllNamed<void>(AppRoutes.login);

  // ── Helpers ──────────────────────────────────────────────────────────────
  void _clearAll() {
    for (final c in [
      loginCredential,
      loginPassword,
      signupFirstName,
      signupLastName,
      signupEmail,
      signupPassword,
      signupConfirmPassword,
      regFirstName,
      regLastName,
      regPosition,
      regEmail,
      regLandline,
      regPhone,
      regCompanyName,
      regCompanyId,
      regAddress,
    ]) {
      c.clear();
    }
    regState.value = null;
    regCertFileName.value = null;
    agreeTerms.value = false;
  }

  @override
  void onClose() {
    loginCredential.dispose();
    loginPassword.dispose();
    signupFirstName.dispose();
    signupLastName.dispose();
    signupEmail.dispose();
    signupPassword.dispose();
    signupConfirmPassword.dispose();
    regFirstName.dispose();
    regLastName.dispose();
    regPosition.dispose();
    regEmail.dispose();
    regLandline.dispose();
    regPhone.dispose();
    regCompanyName.dispose();
    regCompanyId.dispose();
    regAddress.dispose();
    super.onClose();
  }
}
