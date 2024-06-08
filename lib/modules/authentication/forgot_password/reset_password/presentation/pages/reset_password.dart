import 'package:news_app/core/constants/imports.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.resetPasswordCubit;
    final textTheme = context.theme.textTheme;

    return Scaffold(
      appBar: AppBar(),
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
                      padding: EdgeInsets.only(top: 0.0175.sh, bottom: 0.05.sh),
                      child: Text(
                        AppStrings.forgotPasswordMessage,
                        style: textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0175.sh),
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
                  padding: EdgeInsets.only(bottom: 0.025.sh),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppWidgets.customPrimaryButton(
                          type: ButtonType.submit,
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {}
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
