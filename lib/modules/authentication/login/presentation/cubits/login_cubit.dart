import 'package:news_app/core/constants/imports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscureText = ValueNotifier<bool>(true);
  final rememberMe = ValueNotifier<bool>(false);
  final loggingIn = ValueNotifier<bool>(false);

  final formKey = GlobalKey<FormState>();

  final supabase = Supabase.instance.client;

  Future<String?> login() async {
    try {
      loggingIn.value = true;
      await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      return null;
    } on AuthException catch (e) {
      if ((e.code ?? '') == 'email_not_confirmed') {
        return e.code;
      } else {
        loggingIn.value = false;
        return e.message;
      }
    }
  }

  Future<String?> sendOTP() async {
    try {
      await supabase.auth.resend(
        type: OtpType.signup,
        email: emailController.text,
      );
      loggingIn.value = false;
      return null;
    } on AuthException catch (e) {
      loggingIn.value = false;
      return e.message;
    }
  }
}
