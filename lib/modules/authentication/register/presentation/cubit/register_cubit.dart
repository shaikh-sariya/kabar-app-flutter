import 'dart:developer';

import 'package:news_app/core/constants/imports.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final obscureText = ValueNotifier<bool>(true);
  final obscureConfirmText = ValueNotifier<bool>(true);

  final formKey = GlobalKey<FormState>();

  final supabase = Supabase.instance.client;
  BuildContext? context;

  Future<String?> registerUser() async {
    try {
      await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
        data: {
          'fullName': nameController.text.trim(),
          'username': usernameController.text,
        },
      );
      return null;
    } on AuthException catch (e) {
      return e.message;
    }
  }

  Future<void> verifyOTP({required String token}) async {
    final response = await supabase.auth.verifyOTP(
      type: OtpType.email,
      token: token,
      email: emailController.text,
    );
    log('$response');
    log('${response.runtimeType}');
  }
}
