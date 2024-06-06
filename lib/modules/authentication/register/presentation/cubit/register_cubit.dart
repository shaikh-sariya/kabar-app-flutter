import 'package:news_app/core/constants/imports.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final obscureText = ValueNotifier<bool>(true);
  final rememberMe = ValueNotifier<bool>(false);

  final formKey = GlobalKey<FormState>();
}
