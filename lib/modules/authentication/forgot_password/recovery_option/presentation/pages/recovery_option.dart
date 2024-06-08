import 'package:news_app/core/constants/imports.dart';

class RecoveryOptionPage extends StatelessWidget {
  const RecoveryOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.recoveryOptionCubit;
    final textTheme = context.theme.textTheme;

    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Form(
            key: cubit.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.forgot,
                      style: textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${AppStrings.password}?',
                      style: textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0175.sh, bottom: 0.05.sh),
                      child: Text(
                        AppStrings.forgotPasswordMessage,
                        style: textTheme.titleMedium,
                      ),
                    ),
                    AppWidgets.customTextField(
                      context: context,
                      type: TextFieldType.username,
                      controller: cubit.usernameController,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.025.sh),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppWidgets.customPrimaryButton(
                          type: ButtonType.submit,
                          onPressed: () {
                            cubit.formKey.currentState!.validate();
                          },
                          textTheme: textTheme,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
