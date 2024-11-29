import 'package:news_app/core/constants/imports.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.registerCubit;
    final theme = context.theme;
    final textTheme = context.theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: theme.scaffoldBackgroundColor,
      ),
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
                    '${AppStrings.hello}!',
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 48),
                    child: Text(
                      AppStrings.registerMessage,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  AppWidgets.customTextField(
                    context: context,
                    type: TextFieldType.name,
                    controller: cubit.nameController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: AppWidgets.customTextField(
                      context: context,
                      type: TextFieldType.username,
                      controller: cubit.usernameController,
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
                  AppWidgets.customTextField(
                    context: context,
                    type: TextFieldType.confirmPassword,
                    controller: cubit.confirmPasswordController,
                    passwordController: cubit.passwordController,
                    obscureText: cubit.obscureConfirmText,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: RichText(
                      text: TextSpan(
                        style: textTheme.bodySmall?.copyWith(
                          color: theme.hintColor,
                          fontWeight: FontWeight.bold,
                        ),
                        text: AppStrings.note,
                        children: [
                          const TextSpan(text: ': '),
                          TextSpan(
                            style: textTheme.bodySmall
                                ?.copyWith(color: theme.hintColor),
                            text: AppStrings.passwordNote,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppWidgets.customPrimaryButton(
                            type: ButtonType.register,
                            onPressed: () async {
                              if (cubit.formKey.currentState!.validate()) {
                                final response = await cubit.registerUser();
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
                                }
                              }
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
