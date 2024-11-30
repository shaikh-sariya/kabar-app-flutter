import 'package:news_app/core/constants/imports.dart';

class RecoveryOptionPage extends StatelessWidget {
  const RecoveryOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.recoveryOptionCubit;
    final textTheme = context.theme.textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
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
                      width: 0.6.sw,
                      child: Text(
                        AppStrings.forgotPasswordTitle,
                        style: textTheme.displaySmall
                            ?.copyWith(fontWeight: FontWeight.w800),
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
                      type: TextFieldType.email,
                      controller: cubit.emailController,
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
                            final response = await cubit.sendOTP();
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
                                AppWidgets.customSnackBar(
                                  context: context,
                                  content: AppStrings.verificationMessage,
                                  success: true,
                                );
                                context.goNamed(
                                  PAGES.oneTimePassword.screenName,
                                  extra: {
                                    'email': cubit.emailController.text,
                                    'canPop': true,
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
    );
  }
}
