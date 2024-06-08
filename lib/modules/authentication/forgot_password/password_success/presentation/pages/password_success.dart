import 'package:news_app/core/constants/imports.dart';

class PasswordSuccessPage extends StatelessWidget {
  const PasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.025.sw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.appLogo),
                    Padding(
                      padding: EdgeInsets.only(top: 0.05.sh, bottom: 0.01.sh),
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
                padding: EdgeInsets.only(bottom: 0.025.sh),
                child: Row(
                  children: [
                    Expanded(
                      child: AppWidgets.customPrimaryButton(
                        type: ButtonType.goToLogin,
                        onPressed: () {
                          context.goNamed(PAGES.login.screenName);
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
    );
  }
}
