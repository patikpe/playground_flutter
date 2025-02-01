import 'package:go_router/go_router.dart';
import 'package:playground_flutter/features/auth/auth_view.dart';
import 'package:playground_flutter/features/home/home_view.dart';
import 'package:playground_flutter/features/settings/settings_view.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthView(),
      ),
    ],
  );
}
