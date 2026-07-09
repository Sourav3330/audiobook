/// Centralised user-facing strings. Keeps every literal in one place so the
/// app can be localised later without hunting through screens.
class AppStrings {
  AppStrings._();

  // App
  static const appName = 'QR Inspect';
  static const inspectionSystem = 'Inspection System';

  // ── Auth — Login ─────────────────────────────────────────────────────────
  static const loginTitle = 'Inspector Login';
  static const emailOrInspectorId = 'Email or Inspector ID';
  static const passwordHint = '********';
  static const enterCredentials = 'Enter credentials';
  static const password = 'Password';
  static const forgotPassword = 'Forgot Password?';
  static const login = 'Login';
  static const dontHaveAccount = "Don't have an account?";
  static const signUp = 'Sign Up';

  // ── Auth — Signup ────────────────────────────────────────────────────────
  static const signupTitle = 'Inspector Signup';
  static const firstName = 'First Name';
  static const lastName = 'Last Name';
  static const email = 'Email';
  static const confirmPassword = 'Confirm Password';
  static const createAccount = 'Create Account';
  static const alreadyHaveAccount = 'Already have an account?';
  static const logIn = 'Log In';
  static const signIn = 'Sign In';

  // ── Auth — Registration form ─────────────────────────────────────────────
  static const registrationTitle = 'Inspector Registration Form';
  static const registrationSubtitle =
      'Please complete the information below to create your administrator account.';
  static const position = 'Position';
  static const emailAddress = 'Email Address';
  static const landlineNumber = 'Landline Number';
  static const phoneNumber = 'Phone Number';
  static const companyName = 'Company Name';
  static const companyId = 'Company ID';
  static const state = 'State';
  static const qualificationCertificate = 'Qualification Certificate';
  static const companyAddress = 'Company Address';
  static const upload = 'Upload';
  static const selectState = 'Select state';
  static const cancel = 'Cancel';
  static const agreeTermsPrefix = 'I agree to the ';
  static const termsOfService = 'Terms of Service';
  static const and = ' and ';
  static const privacyPolicy = 'Privacy Policy';
  static const agreeTermsSuffix = ' regarding administrative data handling.';

  // Field hints
  static const hintFirstName = 'Enter first name';
  static const hintLastName = 'Enter last name';
  static const hintJohn = 'John';
  static const hintDoe = 'Doe';
  static const hintPosition = 'e.g. System Administrator';
  static const hintAdminEmail = 'admin@company.com';
  static const hintInspectorEmail = 'inspector@example.com';
  static const hintPhone = '+1 (555) 000-0000';
  static const hintLegalEntity = 'Legal entity name';
  static const hintRegistryId = 'Internal registry ID';
  static const hintAddress = 'Street address, Suite, City, ZIP';

  // ── Bottom nav ───────────────────────────────────────────────────────────
  static const tabScanner = 'Scanner';
  static const tabDashboard = 'Dashboard';
  static const tabHistory = 'History';
  static const tabProfile = 'Profile';

  // ── Scanner ──────────────────────────────────────────────────────────────
  static const welcomeInspector = 'Welcome, Inspector';
  static const scanQrCode = 'Scan QR Code';
  static const scanInstruction =
      'Position the QR code within the frame to scan. Ensure the code is well-lit and fits the scanning square.';
  static const turnOnFlash = 'Turn On Flash';
  static const turnOffFlash = 'Turn Off Flash';
  static const qrCodeScanned = 'QR Code Scanned';
  static const scanAgain = 'Scan Again';
  static const cameraUnavailable =
      'Camera unavailable. Grant camera permission and try again.';

  // ── Dashboard ────────────────────────────────────────────────────────────
  static const dashboard = 'Dashboard';
  static const inspectorDashboard = 'Inspector Dashboard';
  static const dashboardSubtitlePrefix = 'Welcome back. You have ';
  static const dashboardSubtitleSuffix = ' scheduled for today.';
  static const exportLog = 'Export Log';
  static const inspectionsToday = 'Inspections Today';
  static const pendingUploads = 'Pending Uploads';
  static const activeJoints = 'Active Joints';
  static const vsYesterday = 'vs yesterday';
  static const waitingForWifi = 'Waiting for WiFi sync';
  static const acrossProjectSites = 'Across 3 project sites';
  static const jointInspectionProgress = 'Joint Inspection Progress';
  static const viewAllActive = 'View All Active';
  static const latestSubmissions = 'Latest Submissions';
  static const last24Hours = 'Last 24 Hours';
  static const qrId = 'QR ID';
  static const jobId = 'Job ID';
  static const progress = 'Progress';
  static const status = 'Status';
  static const projectName = 'Project Name';
  static const time = 'Time';
  static const drawingNo = 'Drawing No.';

  // ── History ──────────────────────────────────────────────────────────────
  static const inspectionManager = 'Inspection Manager';
  static const myHistory = 'My History';
  static const historySubtitle = 'Review and manage your completed inspection logs.';
  static const searchInspections = 'Search inspections...';
  static const allDates = 'All Dates';
  static const assetNameId = 'Asset Name & ID';
  static const dateTime = 'Date & Time';
  static const action = 'Action';
  static const viewDetail = 'View Detail';
  static String showingEntries(int from, int to, int total) =>
      'Showing $from to $to of $total entries';

  // ── Inspection details ───────────────────────────────────────────────────
  static const inspectionDetails = 'Inspection Details';
  static const pointName = 'Point Name';
  static String joint(int n) => 'Joint $n';
  static String inspection(int n) => 'Inspection $n';

  // ── Profile ──────────────────────────────────────────────────────────────
  static const userName = 'User Name';
  static const leadInspector = 'Lead Inspector';
  static const personalInformation = 'Personal Information';
  static const changePassword = 'Change Password';
  static const helpSupport = 'Help & Support';
  static const logout = 'Logout';

  // ── Change password ───────────────────────────────────────────────────────
  static const changePasswordSubtitle =
      'Enter your current password, then choose a new one.';
  static const currentPassword = 'Current Password';
  static const newPassword = 'New Password';
  static const confirmNewPassword = 'Confirm New Password';
  static const updatePassword = 'Update Password';
  static const passwordUpdated = 'Password updated successfully.';
  static const passwordUpdatedSignIn =
      'Password updated. Please sign in with your new password.';

  // ── Personal information ──────────────────────────────────────────────────
  static const accountDetails = 'Account Details';
  static const companyDetails = 'Company Details';
  static const roleLabel = 'Role';
  static const fullName = 'Full Name';
  static const notProvided = '—';
  static const couldNotLoadProfile = 'Could not load your profile.';

  // ── Common states + validation ───────────────────────────────────────────
  static const loading = 'Loading...';
  static const somethingWentWrong = 'Something went wrong';
  static const retry = 'Retry';
  static const required = 'This field is required';
  static const invalidEmail = 'Please enter a valid email';
  static const passwordTooShort = 'Password must be at least 8 characters';
  static const passwordsDoNotMatch = 'Passwords do not match';
  static const comingSoon = 'Coming soon';
  static const mustAgreeTerms = 'Please accept the Terms of Service to continue.';
}
