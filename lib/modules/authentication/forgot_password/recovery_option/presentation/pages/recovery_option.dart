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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      padding: const EdgeInsets.only(top: 16, bottom: 48),
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
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppWidgets.customPrimaryButton(
                          type: ButtonType.submit,
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              context.goNamed(PAGES.resetPassword.screenName);
                            }
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
