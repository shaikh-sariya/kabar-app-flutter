part of 'recovery_option_cubit.dart';

sealed class RecoveryOptionState extends Equatable {
  const RecoveryOptionState();
}

final class RecoveryOptionInitial extends RecoveryOptionState {
  @override
  List<Object> get props => [];
}
