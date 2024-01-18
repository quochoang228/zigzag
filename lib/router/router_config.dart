import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:zigzag/app/coordinator.dart';
import 'package:zigzag/feature/root.dart';
import 'package:zigzag/router/paths.dart';

import '../feature/splash_page.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterConfiguration = GoRouter(
  initialLocation: Paths.splash,
  debugLogDiagnostics: false,
  navigatorKey: AppCoordinator.navigatorKey,
  redirect: _guard,
  routes: [
    ///========== start =========//
    GoRoute(
      path: Paths.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Paths.root,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const RootPage(),
          transitionDuration: const Duration(milliseconds: 450),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    // GoRoute(
    //   path: Paths.root,
    //   builder: (context, state) => FadeTransitionPage(key: Key(value), child: RootPage()),
    // ),
  ],
);

String? _guard(BuildContext context, GoRouterState state) {
  // final bool signedIn = _auth.signedIn;
  // final bool signingIn = state.subloc == '/signin';

  // // Go to /signin if the user is not signed in
  // if (!signedIn && !signingIn) {
  //   return '/signin';
  // }
  // // Go to /books if the user is signed in and tries to go to /signin.
  // else if (signedIn && signingIn) {
  //   return '/books';
  // }

  // no redirect
  return null;
}

// Add animation transition page
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
