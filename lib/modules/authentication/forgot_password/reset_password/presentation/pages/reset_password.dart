import 'package:news_app/core/constants/imports.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({
    required this.email,
    this.user,
    this.canPop,
    super.key,
  });

  final String email;
  final User? user;
  final bool? canPop;

  @override
  Widget build(BuildContext context) {
    final cubit = context.resetPasswordCubit..email = email;
    final theme = context.theme;
    final textTheme = context.theme.textTheme;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: PopScope(
          canPop: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 0.5.sw,
                        child: Text(
                          AppStrings.resetTitle,
                          style: textTheme.displaySmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 48),
                        child: Text(
                          AppStrings.resetPasswordMessage,
                          style: textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: AppWidgets.customTextField(
                          context: context,
                          type: TextFieldType.newPassword,
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
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppWidgets.customPrimaryButton(
                          type: ButtonType.submit,
                          textTheme: textTheme,
                          valueListenable: cubit.submitting,
                          onPressed: () async {
                            if (cubit.formKey.currentState!.validate()) {
                              final response = await cubit.updateUser();
                              if ((response ?? '').isNotEmpty) {
                                final capitalizedResponse = (response ?? '')[0]
                                        .toUpperCase() +
                                    (response ?? '').substring(1).toLowerCase();
                                if (context.mounted) {
                                  AppWidgets.customSnackBar(
                                    context: context,
                                    content: capitalizedResponse,
                                  );
                                }
                              } else {
                                if (context.mounted) {
                                  context.goNamed(
                                    PAGES.passwordSuccess.screenName,
                                    extra: {
                                      'email': email,
                                      'user': user,
                                      'canPop': canPop,
                                    },
                                  );
                                }
                              }
                            }
                          },
                        ),
                      ),
                    ],
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
