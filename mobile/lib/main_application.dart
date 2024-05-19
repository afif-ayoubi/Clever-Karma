import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/api/providers/user_provider.dart';
import 'package:mobile/core/theme/app_theme.dart';
import 'package:mobile/features/auth/presentation/bloc/users/users_bloc.dart';
import 'package:mobile/features/opportunity/presentation/bloc/opportunity_bloc.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'core/api/providers/loader_provider.dart';
import 'core/api/providers/notification_provider.dart';
import 'features/auth/presentation/bloc/onBoarding/on_boarding_bloc.dart';
import 'injection_container.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<UsersBloc>()),
        BlocProvider(create: (_) => di.sl<OpportunityBloc>()),
        BlocProvider(create: (_) => OnboardingBloc()),
        ChangeNotifierProvider(
          create: (_) => NotificationsProvider(),
        ),   ChangeNotifierProvider(
          create: (_) => LoaderProvider(),
        ),  ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          title: 'Clever Karma',
          theme: AppTheme.brightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.goRouter,
        ),
      ),
    );
  }
}
