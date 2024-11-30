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
  final registeringUser = ValueNotifier<bool>(false);

  final supabase = Supabase.instance.client;
  User? user;

  Future<String?> registerUser() async {
    try {
      registeringUser.value = true;
      final response = await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
        data: {
          'fullName': nameController.text.trim(),
          'username': usernameController.text,
        },
      );
      user = response.user;
      return null;
    } on AuthException catch (e) {
      registeringUser.value = false;
      return e.message;
    }
  }
}
