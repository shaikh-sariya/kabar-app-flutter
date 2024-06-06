import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final obscureText = ValueNotifier<bool>(true);
  final rememberMe = ValueNotifier<bool>(false);

  final formKey = GlobalKey<FormState>();
}
