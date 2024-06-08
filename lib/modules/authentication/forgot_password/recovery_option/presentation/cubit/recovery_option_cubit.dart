import 'package:news_app/core/constants/imports.dart';

part 'recovery_option_state.dart';

class RecoveryOptionCubit extends Cubit<RecoveryOptionState> {
  RecoveryOptionCubit() : super(RecoveryOptionInitial());

  final usernameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
}
