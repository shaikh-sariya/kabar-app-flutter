import 'package:news_app/core/constants/imports.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  late AnimationController controller;
  late Animation<double> animation;
}
