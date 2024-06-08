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
      case PAGES.recoveryOption:
        return 'recovery-option';
      case PAGES.resetPassword:
        return 'reset-password';
      case PAGES.passwordSuccess:
        return 'password-success';
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
      case PAGES.recoveryOption:
        return 'RECOVERY OPTION';
      case PAGES.resetPassword:
        return 'RESET PASSWORD';
      case PAGES.passwordSuccess:
        return 'PASSWORD SUCCESS';
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
      case PAGES.recoveryOption:
        return 'Recovery Option';
      case PAGES.resetPassword:
        return 'Reset Password';
      case PAGES.passwordSuccess:
        return 'Password Success';
    }
  }
}
