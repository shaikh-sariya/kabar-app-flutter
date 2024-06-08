import 'package:news_app/core/enums/pages.dart';

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return '/splash';
      case PAGES.introduction:
        return '/introduction';
      case PAGES.login:
        return '/login';
      case PAGES.register:
        return 'register';
      case PAGES.forgotPassword:
        return 'forgot-password';
      case PAGES.recoveryOption:
        return 'recovery-option';
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.splash:
        return 'SPLASH';
      case PAGES.introduction:
        return 'INTRODUCTION';
      case PAGES.login:
        return 'LOGIN';
      case PAGES.register:
        return 'REGISTER';
      case PAGES.forgotPassword:
        return 'FORGOT PASSWORD';
      case PAGES.recoveryOption:
        return 'RECOVERY OPTION';
    }
  }

  String get screenTitle {
    switch (this) {
      case PAGES.splash:
        return 'Splash';
      case PAGES.introduction:
        return 'Introduction';
      case PAGES.login:
        return 'Login';
      case PAGES.register:
        return 'Register';
      case PAGES.forgotPassword:
        return 'Forgot Password';
      case PAGES.recoveryOption:
        return 'Recovery Option';
    }
  }
}
