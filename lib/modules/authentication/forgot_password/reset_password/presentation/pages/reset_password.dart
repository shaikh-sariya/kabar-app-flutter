import 'package:news_app/core/constants/imports.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.resetPasswordCubit;
    final textTheme = context.theme.textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
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
                      AppStrings.reset,
                      style: textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      AppStrings.password,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AppWidgets.customTextField(
                        context: context,
                        type: TextFieldType.newPassword,
                        controller: cubit.passwordController,
                      ),
                    ),
                    AppWidgets.customTextField(
                      context: context,
                      type: TextFieldType.confirmPassword,
                      controller: cubit.confirmPasswordController,
                      passwordController: cubit.passwordController,
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
                              context.goNamed(PAGES.passwordSuccess.screenName);
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
