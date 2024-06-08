part of 'password_success_cubit.dart';

sealed class PasswordSuccessState extends Equatable {
  const PasswordSuccessState();
}

final class PasswordSuccessInitial extends PasswordSuccessState {
  @override
  List<Object> get props => [];
}
