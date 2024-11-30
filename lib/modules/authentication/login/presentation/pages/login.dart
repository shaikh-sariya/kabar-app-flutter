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
            padding: const EdgeInsets.all(16),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.hello,
                    style: textTheme.displayMedium
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    AppStrings.again,
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 48),
                    child: Text(
                      AppStrings.welcomeBackMessage,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  AppWidgets.customTextField(
                    context: context,
                    type: TextFieldType.email,
                    controller: cubit.emailController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
                                width: 16,
                                height: 16,
                                margin: const EdgeInsets.only(right: 8),
                                child: Checkbox(
                                  value: value,
                                  fillColor: WidgetStatePropertyAll(
                                    value ? AppColors.primary : AppColors.white,
                                  ),
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
                          style: textTheme.labelLarge
                              ?.copyWith(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppWidgets.customPrimaryButton(
                            type: ButtonType.login,
                            textTheme: textTheme,
                            valueListenable: cubit.loggingIn,
                            onPressed: () async {
                              if (cubit.formKey.currentState!.validate()) {
                                final response = await cubit.login();
                                if ((response ?? '').isNotEmpty) {
                                  final capitalizedResponse =
                                      (response ?? '')[0].toUpperCase() +
                                          (response ?? '')
                                              .substring(1)
                                              .toLowerCase();
                                  final success =
                                      (response ?? '') == 'email_not_confirmed';
                                  if (context.mounted && !success) {
                                    AppWidgets.customSnackBar(
                                      context: context,
                                      content: capitalizedResponse,
                                    );
                                  }
                                  if (success) {
                                    final response = await cubit.sendOTP();
                                    if ((response ?? '').isNotEmpty) {
                                      final capitalizedResponse =
                                          (response ?? '')[0].toUpperCase() +
                                              (response ?? '')
                                                  .substring(1)
                                                  .toLowerCase();
                                      if (context.mounted) {
                                        AppWidgets.customSnackBar(
                                          context: context,
                                          content: capitalizedResponse,
                                        );
                                      }
                                    } else {
                                      if (context.mounted) {
                                        AppWidgets.customSnackBar(
                                          context: context,
                                          content:
                                              AppStrings.verificationMessage,
                                          success: success,
                                        );
                                        await context.pushNamed(
                                          PAGES.oneTimePassword.screenName,
                                          extra: {
                                            'email': cubit.emailController.text,
                                          },
                                        );
                                      }
                                    }
                                  }
                                } else {
                                  // TODO(navigation): Navigate to HomePage.
                                }
                              }
                            },
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
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 48,
                      ),
                      children: [
                        AppWidgets.customSocialButton(
                          textTheme: textTheme,
                          type: SocialPlatformType.facebook,
                        ),
                        AppWidgets.customSocialButton(
                          textTheme: textTheme,
                          type: SocialPlatformType.google,
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
