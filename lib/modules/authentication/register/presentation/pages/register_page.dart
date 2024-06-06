import 'package:news_app/core/constants/imports.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.registerCubit;
    final textTheme = context.theme.textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppStrings.hello}!',
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0175.sh, bottom: 0.05.sh),
                    child: Text(
                      AppStrings.registerMessage,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  AppWidgets.customTextField(
                    context: context,
                    type: TextFieldType.username,
                    controller: cubit.usernameController,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.015.sh),
                    child: AppWidgets.customTextField(
                      context: context,
                      type: TextFieldType.password,
                      controller: cubit.passwordController,
                      obscureText: cubit.obscureText,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.025.sh),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppWidgets.customPrimaryButton(
                            type: ButtonType.register,
                            onPressed: () {
                              cubit.formKey.currentState!.validate();
                            },
                            textTheme: textTheme,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    child: Text(
                      AppStrings.orContinueWith,
                      style: textTheme.labelMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.025.sh),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 0.025.sw),
                            child: AppWidgets.customSocialButton(
                              textTheme: textTheme,
                              type: SocialPlatformType.facebook,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.025.sw),
                            child: AppWidgets.customSocialButton(
                              textTheme: textTheme,
                              type: SocialPlatformType.google,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    child: RichText(
                      text: TextSpan(
                        text: AppStrings.haveAccount,
                        style: textTheme.labelLarge,
                        children: [
                          TextSpan(
                            text: ' ${AppStrings.login}',
                            style: textTheme.labelLarge
                                ?.copyWith(color: AppColors.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
