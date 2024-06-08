import 'package:news_app/core/constants/imports.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  GoRouterState get goRouterState => GoRouterState.of(this);

  SplashCubit get splashCubit => read<SplashCubit>();

  IntroductionCubit get introductionCubit => read<IntroductionCubit>();

  LoginCubit get loginCubit => read<LoginCubit>();

  RegisterCubit get registerCubit => read<RegisterCubit>();

  RecoveryOptionCubit get recoveryOptionCubit => read<RecoveryOptionCubit>();

  ResetPasswordCubit get resetPasswordCubit => read<ResetPasswordCubit>();

  PasswordSuccessCubit get passwordSuccessCubit => read<PasswordSuccessCubit>();
}
