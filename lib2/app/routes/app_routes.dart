/// Static route names — keeps strings out of `Get.toNamed` calls.
class AppRoutes {
  AppRoutes._();

  // Startup
  static const String splash = '/splash';

  // Auth
  static const String login = '/login';
  static const String signup = '/signup';
  static const String registration = '/registration';

  // Authenticated shell (bottom-nav host)
  static const String shell = '/';

  // History detail (pushed above the shell)
  static const String inspectionDetail = '/inspection-detail';

  // Profile
  static const String personalInfo = '/profile/personal-info';
  static const String changePassword = '/profile/change-password';
}
