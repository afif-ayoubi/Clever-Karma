import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/features/auth/presentation/pages/auth_page.dart';
import 'package:mobile/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:mobile/features/auth/presentation/pages/onboarding_page.dart';
import 'package:mobile/features/auth/presentation/pages/otp_verification_screen.dart';
import 'package:mobile/features/auth/presentation/pages/profile_page.dart';
import 'package:mobile/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:mobile/features/opportunity/presentation/pages/map_page.dart';
import 'package:mobile/features/opportunity/presentation/pages/organizations_page.dart';
import 'package:mobile/features/organization/presentation/pages/graph_page.dart';
import 'package:mobile/features/organization/presentation/pages/org_entry_page.dart';
import 'package:mobile/features/organization/presentation/widgets/graph_page/line_chart_widget.dart';
import 'package:mobile/routes/class_routes.dart';

import '../features/live_streaming/presentation/pages/live_streaming.dart';
import '../features/opportunity/presentation/pages/entry_page.dart';
import '../features/opportunity/presentation/pages/notifications_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final GoRouter goRouter = GoRouter(
      initialLocation: Routes.authRoute,
      navigatorKey: navigatorKey,
      routes: [
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
            builder: ((context, state) =>  OrganizationsPage(name: state.uri.queryParameters['name']!,))),
        GoRoute(
          path: Routes.mapPage,
          builder: (context, state) {
            return MapPage(
                realDistance: state.uri.queryParameters['realDistance']!,
                longitude: state.uri.queryParameters['longitude']!,
                latitude: state.uri.queryParameters['latitude']!,
            organizationLatitude: state.uri.queryParameters['organizationLatitude']!,
            organizationLongitude: state.uri.queryParameters['organizationLongitude']!,
            title: state.uri.queryParameters['title']!);

          },
        ),
        GoRoute(
            path: Routes.notificationPage,
            builder: ((context, state) => const NotificationPage())),
        GoRoute(
            path: Routes.orgEntryPage,
            builder: ((context, state) => const OrgEntryPage())),
      ]);
}
