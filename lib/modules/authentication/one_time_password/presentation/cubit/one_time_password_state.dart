part of 'one_time_password_cubit.dart';

sealed class OneTimePasswordState extends Equatable {
  const OneTimePasswordState();
}

final class OneTimePasswordInitial extends OneTimePasswordState {
  @override
  List<Object> get props => [];
}
