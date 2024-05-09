part of 'introduction_cubit.dart';

sealed class IntroductionState extends Equatable {
  const IntroductionState();
}

final class IntroductionInitial extends IntroductionState {
  @override
  List<Object> get props => [];
}
