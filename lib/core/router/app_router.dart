import 'package:flutter_epsilon_v2/core/shared/pages/home_page.dart';
import 'package:flutter_epsilon_v2/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter_epsilon_v2/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_epsilon_v2/features/auth/presentation/pages/register_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/auth',
  routes: <GoRoute>[
    GoRoute(path: '/auth', builder: (context, state) => AuthPage()),
    GoRoute(path: '/auth/login', builder: (context, state) => LoginPage()),
    GoRoute(
      path: '/auth/register',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
  ],
);
