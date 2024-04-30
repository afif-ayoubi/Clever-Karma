import 'package:go_router/go_router.dart';
import 'package:mobile/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:mobile/features/auth/presentation/pages/onboarding_page.dart';
import 'package:mobile/features/auth/presentation/pages/otp_verification_screen.dart';
import 'package:mobile/routes/class_routes.dart';

class AppRoutes {
  static final GoRouter goRouter =
      GoRouter(initialLocation: Routes.initRoute, routes: [
        GoRoute(path: Routes.initRoute,builder: ((context,state)=>const OnBoardingPage())),
        GoRoute(path: Routes.forgotPasswordRoute,builder: ((context,state)=>const ForgotPassword())),
        GoRoute(path: Routes.otpVerificationRoute,builder: ((context,state)=>const OtpVerificationPage()))
        GoRoute(path: Routes.resetPasswordRoute,builder: ((context,state)=>const OtpVerificationPage()))
      ]);
}
