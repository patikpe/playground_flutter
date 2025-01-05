import 'package:go_router/go_router.dart';
import 'package:playground_flutter/modules/home/home_view.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
