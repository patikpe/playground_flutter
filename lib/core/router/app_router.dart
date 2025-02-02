import 'package:go_router/go_router.dart';
import 'package:playground_flutter/features/auth/view/auth_view.dart';
import 'package:playground_flutter/features/auth/view/login_view.dart';
import 'package:playground_flutter/features/auth/view/register_view.dart';
import 'package:playground_flutter/features/home/home_view.dart';
import 'package:playground_flutter/features/settings/settings_view.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AuthView(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginView(),
          ),
          GoRoute(
            path: 'register',
            builder: (context, state) => const RegisterView(),
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsView(),
      ),
    ],
  );
}
