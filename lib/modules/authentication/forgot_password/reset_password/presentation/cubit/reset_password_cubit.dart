import 'package:news_app/core/constants/imports.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final obscureText = ValueNotifier<bool>(true);
  final obscureConfirmText = ValueNotifier<bool>(true);

  final formKey = GlobalKey<FormState>();
  final submitting = ValueNotifier<bool>(false);

  final supabase = Supabase.instance.client;
  String? email;

  Future<String?> updateUser() async {
    try {
      submitting.value = true;
      await supabase.auth.updateUser(
        UserAttributes(email: email, password: passwordController.text),
      );
      return null;
    } on AuthException catch (e) {
      submitting.value = false;
      return e.message;
    }
  }
}
