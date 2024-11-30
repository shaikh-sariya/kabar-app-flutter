import 'package:news_app/core/constants/imports.dart';

class PasswordSuccessPage extends StatelessWidget {
  const PasswordSuccessPage({
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
    final textTheme = context.theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: PopScope(
          canPop: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.appLogo),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 48),
                        child: Text(
                          AppStrings.successTitle,
                          style: textTheme.displaySmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      Text(
                        AppStrings.successMessage,
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppWidgets.customPrimaryButton(
                          type: ButtonType.goToLogin,
                          onPressed: () {
                            Navigator.of(context).popUntil(
                              ModalRoute.withName(PAGES.login.screenName),
                            );
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
