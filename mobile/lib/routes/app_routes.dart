import 'package:go_router/go_router.dart';
import 'package:mobile/routes/class_routes.dart';

class AppRoutes {
  static final GoRouter goRouter =
      GoRouter(initialLocation: Routes.initRoute, routes: [
        GoRoute(path: Routes.initRoute,builder: ((context,state)=>Null))
      ]);
}
