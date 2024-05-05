import 'package:go_router/go_router.dart';
import 'package:mobile/features/auth/presentation/pages/auth_page.dart';
import 'package:mobile/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:mobile/features/auth/presentation/pages/onboarding_page.dart';
import 'package:mobile/features/auth/presentation/pages/otp_verification_screen.dart';
import 'package:mobile/features/auth/presentation/pages/profile_page.dart';
import 'package:mobile/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:mobile/features/opportunity/presentation/pages/map_page.dart';
import 'package:mobile/features/opportunity/presentation/pages/organizations_page.dart';
import 'package:mobile/routes/class_routes.dart';

import '../features/opportunity/presentation/pages/entry_page.dart';

class AppRoutes {
  static final GoRouter goRouter =
      GoRouter(initialLocation: Routes.mapPage, routes: [
    GoRoute(
        path: Routes.initRoute,
        builder: ((context, state) => const OnBoardingPage())),
    GoRoute(
        path: Routes.forgotPasswordRoute,
        builder: ((context, state) => const ForgotPassword())),
    GoRoute(
        path: Routes.otpVerificationRoute,
        builder: ((context, state) => const OtpVerificationPage())),
    GoRoute(
        path: Routes.resetPasswordRoute,
        builder: ((context, state) => const ResetPasswordPage())),
    GoRoute(
        path: Routes.profileRoute,
        builder: ((context, state) => const ProfilePage())),
    GoRoute(
        path: Routes.authRoute,
        builder: ((context, state) => const AuthPage())),
    GoRoute(
        path: Routes.entryPage,
        builder: ((context, state) => const EntryPage())),
    GoRoute(
        path: Routes.organizationsPage,
        builder: ((context, state) => const OrganizationsPage())),
    GoRoute(
        path: Routes.mapPage, builder: ((context, state) => const MapPage())),
  ]);
}
