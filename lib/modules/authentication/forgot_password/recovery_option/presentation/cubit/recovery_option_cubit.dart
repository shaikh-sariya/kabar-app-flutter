import 'package:news_app/core/constants/imports.dart';

part 'recovery_option_state.dart';

class RecoveryOptionCubit extends Cubit<RecoveryOptionState> {
  RecoveryOptionCubit() : super(RecoveryOptionInitial());

  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final submitting = ValueNotifier<bool>(false);

  final supabase = Supabase.instance.client;

  Future<String?> sendOTP() async {
    try {
      submitting.value = true;
      await supabase.auth.resetPasswordForEmail(emailController.text);
      submitting.value = false;
      return null;
    } on AuthException catch (e) {
      submitting.value = false;
      return e.message;
    }
  }
}
