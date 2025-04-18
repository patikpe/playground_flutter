import 'package:firebase_auth/firebase_auth.dart';

import 'package:go_router/go_router.dart';
import 'package:playground_flutter/features/auth/view/auth_view.dart';
import 'package:playground_flutter/features/auth/view/login_view.dart';
import 'package:playground_flutter/features/auth/view/register_view.dart';
import 'package:playground_flutter/features/home/home_view.dart';
import 'package:playground_flutter/features/settings/settings_view.dart';
import 'package:playground_flutter/widgets/general_widgets/screen_not_found.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
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
        redirect: (context, state) {
          if (FirebaseAuth.instance.currentUser != null) {
            return '/home';
          }
          return null;
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: '/notFound',
        builder: (context, state) => const ScreenNotFound(),
      ),
    ],
    errorBuilder: (context, state) => const ScreenNotFound(),
    redirect: (context, state) {
      if (FirebaseAuth.instance.currentUser == null) {
        if (state.fullPath == '/login' || state.fullPath == '/register') {
          return null;
        }
        return '/login';
      }
      return null;
    },
  );
}
