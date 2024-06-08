import 'package:news_app/core/constants/imports.dart';

class AppRouter {
  const AppRouter._();

  static final _rootNavigator = GlobalKey<NavigatorState>();

  static final _initialLocation = PAGES.splash.screenPath;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigator,
    initialLocation: _initialLocation,
    observers: [MyRouteObserver()],
    routes: [
      GoRoute(
        path: PAGES.splash.screenPath,
        name: PAGES.splash.screenName,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit(),
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: PAGES.introduction.screenPath,
        name: PAGES.introduction.screenName,
        builder: (context, state) => BlocProvider(
          create: (context) => IntroductionCubit(),
          child: const IntroductionPage(),
        ),
      ),
      GoRoute(
        path: PAGES.login.screenPath,
        name: PAGES.login.screenName,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginPage(),
        ),
        routes: [
          GoRoute(
            path: PAGES.register.screenPath,
            name: PAGES.register.screenName,
            builder: (context, state) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: const RegisterPage(),
            ),
          ),
          GoRoute(
            path: PAGES.forgotPassword.screenPath,
            name: PAGES.forgotPassword.screenName,
            builder: (context, state) => const Scaffold(),
            routes: [
              GoRoute(
                path: PAGES.recoveryOption.screenPath,
                name: PAGES.recoveryOption.screenName,
                builder: (context, state) => BlocProvider(
                  create: (context) => RecoveryOptionCubit(),
                  child: const RecoveryOptionPage(),
                ),
              ),
              GoRoute(
                path: PAGES.resetPassword.screenPath,
                name: PAGES.resetPassword.screenName,
                builder: (context, state) => BlocProvider(
                  create: (context) => ResetPasswordCubit(),
                  child: const ResetPasswordPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
