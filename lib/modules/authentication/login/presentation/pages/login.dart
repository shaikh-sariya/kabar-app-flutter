import 'package:news_app/core/constants/imports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.loginCubit;
    final textTheme = context.theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(0.05.sw),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.hello,
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    AppStrings.again,
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0175.sh, bottom: 0.05.sh),
                    child: Text(
                      AppStrings.welcomeBackMessage,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: cubit.rememberMe,
                            builder: (context, value, child) {
                              return Container(
                                width: 0.04.sw,
                                height: 0.04.sw,
                                margin: EdgeInsets.only(right: 0.02.sw),
                                child: Checkbox(
                                  value: value,
                                  onChanged: (value) {
                                    cubit.rememberMe.value = value!;
                                  },
                                ),
                              );
                            },
                          ),
                          Text(
                            AppStrings.rememberMe,
                            style: textTheme.labelLarge,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          context.goNamed(PAGES.recoveryOption.screenName);
                        },
                        child: Text(
                          AppStrings.forgotPassword,
                          style: textTheme.labelLarge?.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.025.sh),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppWidgets.customPrimaryButton(
                            type: ButtonType.login,
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
                        text: AppStrings.noAccount,
                        style: textTheme.labelLarge,
                        children: [
                          TextSpan(
                            text: ' ${AppStrings.register}',
                            style: textTheme.labelLarge
                                ?.copyWith(color: AppColors.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.goNamed(PAGES.register.screenName);
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
