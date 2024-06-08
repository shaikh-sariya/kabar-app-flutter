part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();
}

final class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object> get props => [];
}
