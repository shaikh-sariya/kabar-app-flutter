import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'introduction_state.dart';

class IntroductionCubit extends Cubit<IntroductionState> {
  IntroductionCubit() : super(IntroductionInitial());
}
