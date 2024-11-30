import 'package:news_app/core/constants/imports.dart';

part 'one_time_password_state.dart';

class OneTimePasswordCubit extends Cubit<OneTimePasswordState> {
  OneTimePasswordCubit() : super(OneTimePasswordInitial()) {
    startResendOtpTimer(initial: true);
  }

  final formKey = GlobalKey<FormState>();
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  final supabase = Supabase.instance.client;
  User? user;

  final canResendOtp = ValueNotifier<bool>(false);
  final submittingOTP = ValueNotifier<bool>(false);
  final secondsRemaining = ValueNotifier<int>(60);
  Timer? resendOtpTimer;

  Future<String?> verifyOTP() async {
    try {
      submittingOTP.value = true;
      await supabase.auth.verifyOTP(
        type: OtpType.email,
        token: controllers.map((e) => e.text).join(),
        email: user?.email,
      );
      await supabase.auth.updateUser(
        UserAttributes(data: {'email_verified': true}),
      );
      return null;
    } on AuthException catch (e) {
      submittingOTP.value = false;
      return e.message;
    }
  }

  Future<String?> resendOTP() async {
    try {
      await supabase.auth.resend(
        type: OtpType.email,
        email: user?.email,
      );
      return null;
    } on AuthException catch (e) {
      return e.message;
    }
  }

  void startResendOtpTimer({required bool initial}) {
    if (!initial) {
      resendOTP();
    }
    secondsRemaining.value = 60;
    canResendOtp.value = false;

    resendOtpTimer?.cancel();
    resendOtpTimer = Timer.periodic(const Duration(seconds: 1), (time) {
      if (secondsRemaining.value != 0) {
        secondsRemaining.value -= 1;
      } else {
        canResendOtp.value = true;
      }
    });
  }

  @override
  Future<void> close() {
    resendOtpTimer?.cancel();
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    return super.close();
  }
}
