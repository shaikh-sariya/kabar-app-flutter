import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final showPassword = ValueNotifier<bool>(false);
  final rememberMe = ValueNotifier<bool>(false);
}
