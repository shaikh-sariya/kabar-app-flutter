import 'package:news_app/core/constants/imports.dart';

class OneTimePasswordPage extends StatelessWidget {
  const OneTimePasswordPage({this.user, this.email, this.canPop, super.key});

  final User? user;
  final String? email;
  final bool? canPop;

  @override
  Widget build(BuildContext context) {
    final cubit = context.oneTimePasswordCubit
      ..user = user
      ..email = email
      ..canPop = canPop;
    final theme = context.theme;
    final textTheme = context.theme.textTheme;
    final emailAddress = user?.email ?? email;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: canPop ?? false,
      ),
      body: SafeArea(
        child: PopScope(
          canPop: canPop ?? false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        AppStrings.otpTitle,
                        style: textTheme.headlineLarge
                            ?.copyWith(color: AppColors.body),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 48),
                        child: Text(
                          '${AppStrings.otpMessage}$emailAddress',
                          style: textTheme.titleMedium
                              ?.copyWith(color: AppColors.body),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AppWidgets.customOTPFields(
                        controllers: cubit.controllers,
                        focusNodes: cubit.focusNodes,
                        context: context,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: ValueListenableBuilder(
                          valueListenable: cubit.canResendOtp,
                          builder: (context, value, child) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: !value,
                                child: ValueListenableBuilder(
                                  valueListenable: cubit.secondsRemaining,
                                  builder: (context, value, child) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppStrings.resendMessage,
                                        style: textTheme.bodyMedium
                                            ?.copyWith(color: AppColors.body),
                                      ),
                                      Text(
                                        '${value}s',
                                        style: textTheme.bodyMedium?.copyWith(
                                          color: AppColors.mandatory,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: value,
                                child: GestureDetector(
                                  onTap: () {
                                    cubit.startResendOtpTimer(initial: false);
                                  },
                                  child: Text(
                                    AppStrings.resend,
                                    style: textTheme.bodyMedium
                                        ?.copyWith(color: AppColors.mandatory),
                                  ),
                                ),
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
                          valueListenable: cubit.submittingOTP,
                          onPressed: () async {
                            final response = await cubit.verifyOTP();
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
                                if (canPop ?? false) {
                                  context.goNamed(
                                    PAGES.resetPassword.screenName,
                                    extra: {'email': email ?? ''},
                                  );
                                } else {
                                  Navigator.of(context).popUntil(
                                    ModalRoute.withName(PAGES.login.screenName),
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
