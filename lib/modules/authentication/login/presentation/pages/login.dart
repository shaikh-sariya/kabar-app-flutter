import 'package:news_app/core/constants/imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    padding: EdgeInsets.symmetric(vertical: 0.0175.sh),
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
                        onTap: () async {},
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
                          child: FilledButton(
                            onPressed: () {
                              cubit.formKey.currentState!.validate();
                            },
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 13,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              backgroundColor: AppColors.primary,
                            ),
                            child: Text(
                              AppStrings.login,
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                            child: FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 13,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                backgroundColor: AppColors.secondaryButton,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.facebook),
                                  Text(
                                    '  ${AppStrings.facebook}',
                                    style: textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.025.sw),
                            child: FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 13,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                backgroundColor: AppColors.secondaryButton,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.google),
                                  Text(
                                    '  ${AppStrings.google}',
                                    style: textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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
