import 'package:news_app/core/constants/imports.dart';

part 'introduction_state.dart';

class IntroductionCubit extends Cubit<IntroductionState> {
  IntroductionCubit() : super(IntroductionInitial());

  final currentPage = ValueNotifier<int>(0);
  PageController? controller;
}
