import 'package:news_app/core/constants/imports.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final obscureText = ValueNotifier<bool>(true);
  final obscureConfirmText = ValueNotifier<bool>(true);

  final formKey = GlobalKey<FormState>();
}
