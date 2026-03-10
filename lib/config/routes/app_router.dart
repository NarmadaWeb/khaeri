import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/onboarding/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen_1.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen_2.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding-1',
        builder: (context, state) => const OnboardingScreen1(),
      ),
      GoRoute(
        path: '/onboarding-2',
        builder: (context, state) => const OnboardingScreen2(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
}
