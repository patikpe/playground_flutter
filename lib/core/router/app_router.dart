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
      ShellRoute(
        builder: (context, state, child) => AuthView(child: child),
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) => LoginView(),
          ),
          GoRoute(
            path: '/register',
            builder: (context, state) => RegisterView(),
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
