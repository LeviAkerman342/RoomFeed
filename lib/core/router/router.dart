import 'package:go_router/go_router.dart';
import 'package:myapp/core/app_state.dart';
import 'package:myapp/presentation/pages/explore_page.dart';
import 'package:myapp/presentation/pages/login_page.dart';
import 'package:myapp/presentation/pages/onboarding.dart';
import 'package:myapp/presentation/pages/onboarding_page2.dart';
import 'package:myapp/presentation/pages/projects_page.dart';
import 'package:myapp/presentation/pages/settings_page.dart';
import 'package:myapp/presentation/pages/signup_page.dart';
import 'package:myapp/presentation/pages/subscription_page.dart';
import 'package:myapp/presentation/pages/verification_page.dart';
import 'package:myapp/presentation/widgets/main_scaffold.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final bool onboardingDone = AppState.onboardingCompleted;
    final bool loggedIn = AppState.isLoggedIn;

    final bool isOnOnboarding = state.matchedLocation.startsWith('/onboarding');
    final bool isOnAuth =
        state.matchedLocation == '/login' ||
        state.matchedLocation == '/signup' ||
        state.matchedLocation == '/verification';
    final bool isOnMain = state.matchedLocation == '/main';

    //Если онбординг не пройден — отправляем на него
    if (!onboardingDone && !isOnOnboarding) {
      return '/onboarding1';
    }

    //Если онбординг пройден, но не авторизован — на подписку/логин
    if (onboardingDone &&
        !loggedIn &&
        !isOnAuth &&
        !state.matchedLocation.startsWith('/subscription')) {
      return '/subscription';
    }

    //Если авторизован — на главный экран
    if (loggedIn && !isOnMain && !isOnOnboarding && !isOnAuth) {
      return '/main';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/onboarding1',
      builder: (context, state) => const OnboardingPage1(),
    ),
    GoRoute(
      path: '/onboarding2',
      builder: (context, state) => const OnboardingPage2(),
    ),

    GoRoute(
      path: '/subscription',
      builder: (context, state) => const SubscriptionPage(),
    ),

    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
    GoRoute(
      path: '/verification',
      builder: (context, state) {
        final email = state.extra as String?;
        return VerificationPage(email: email ?? 'unknown@email.com');
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, router, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/explore',
              builder: (context, state) => const ExplorePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/projects',
              builder: (context, state) => const ProjectsPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(path: '/', redirect: (context, state) => '/main'),
  ],
);
