import 'package:news_app/core/constants/imports.dart';

class AppWidgets {
  AppWidgets._();

  static Widget customTextField({
    required BuildContext context,
    required TextFieldType type,
    required TextEditingController controller,
    ValueNotifier<bool>? obscureText,
    TextEditingController? passwordController,
  }) {
    final textTheme = context.theme.textTheme;
    String text;
    String labelText;
    List<TextInputFormatter>? inputFormatters;
    String? Function(String?)? validator;

    switch (type) {
      case TextFieldType.name:
        text = AppStrings.name;
        labelText = AppStrings.enterName;
        inputFormatters = [
          NameInputFormatter(),
          FirstLetterUppercaseFormatter(),
        ];
        validator = (value) {
          if ((value ?? '').isEmpty) {
            return AppStrings.required;
          }
          if (!AppValidators.validateName(value ?? '')) {
            return AppStrings.validName;
          }
          return null;
        };
      case TextFieldType.email:
        text = AppStrings.email;
        labelText = AppStrings.enterEmail;
        inputFormatters = [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-]')),
        ];
        validator = (value) {
          if ((value ?? '').isEmpty) {
            return AppStrings.required;
          }
          if (!AppValidators.validateEmail(value ?? '')) {
            return AppStrings.validEmail;
          }
          return null;
        };
      case TextFieldType.username:
        text = AppStrings.userName;
        labelText = AppStrings.enterUsername;
        inputFormatters = [UsernameInputFormatter()];
        validator = (value) {
          if ((value ?? '').isEmpty) {
            return AppStrings.required;
          }
          if (!AppValidators.validateUsername(value ?? '')) {
            return AppStrings.validUsername;
          }
          return null;
        };
      case TextFieldType.password:
        text = AppStrings.password;
        labelText = AppStrings.enterPassword;
        inputFormatters = [
          FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z0-9!@#$%^&*()_+=-]+'),
          ),
        ];
        validator = (value) {
          if ((value ?? '').isEmpty) {
            return AppStrings.required;
          }
          if (!AppValidators.validateStrongPassword(value ?? '')) {
            return AppStrings.enterValidPassword;
          }
          return null;
        };
      case TextFieldType.newPassword:
        text = AppStrings.newPassword;
        labelText = AppStrings.enterNewPassword;
        inputFormatters = [
          FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z0-9!@#$%^&*()_+=-]+'),
          ),
        ];
        validator = (value) {
          if ((value ?? '').isEmpty) {
            return AppStrings.required;
          }
          return null;
        };
      case TextFieldType.confirmPassword:
        text = AppStrings.confirmPassword;
        labelText = AppStrings.enterConfirmPassword;
        inputFormatters = [
          FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z0-9!@#$%^&*()_+=-]+'),
          ),
        ];
        validator = (value) {
          if ((value ?? '').isEmpty) {
            return AppStrings.required;
          } else if ((value ?? '') !=
              (passwordController ?? TextEditingController()).text) {
            return AppStrings.passwordErrorText;
          }
          return null;
        };
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: text,
            style: textTheme.labelLarge,
            children: [
              TextSpan(
                text: AppStrings.asterisk,
                style:
                    textTheme.labelLarge?.copyWith(color: AppColors.mandatory),
              ),
            ],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: obscureText ?? ValueNotifier<bool>(false),
          builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.only(top: 0.01.sh),
              child: TextFormField(
                controller: controller,
                inputFormatters: inputFormatters,
                validator: validator,
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                },
                obscureText: value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: const BorderSide(color: AppColors.body),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: const BorderSide(color: AppColors.mandatory),
                  ),
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixText: type == TextFieldType.username ? '@' : null,
                  suffixIcon: type == TextFieldType.password ||
                          type == TextFieldType.confirmPassword
                      ? value
                          ? GestureDetector(
                              onTap: () async {
                                obscureText?.value = !value;
                              },
                              child: const Icon(Icons.visibility_off_outlined),
                            )
                          : GestureDetector(
                              onTap: () async {
                                obscureText?.value = !value;
                              },
                              child: const Icon(Icons.visibility_outlined),
                            )
                      : null,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  static Widget customSocialButton({
    required TextTheme textTheme,
    required SocialPlatformType type,
    void Function()? onPressed,
  }) {
    String title;
    String assetName;

    switch (type) {
      case SocialPlatformType.facebook:
        assetName = AppImages.facebook;
        title = '  ${AppStrings.facebook}';
      case SocialPlatformType.google:
        assetName = AppImages.google;
        title = '  ${AppStrings.google}';
    }
    return FilledButton(
      onPressed: onPressed,
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
          SvgPicture.asset(assetName),
          Text(
            title,
            style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static Widget customPrimaryButton({
    required ButtonType type,
    required void Function()? onPressed,
    required TextTheme textTheme,
  }) {
    String title;

    switch (type) {
      case ButtonType.login:
        title = AppStrings.login;
      case ButtonType.register:
        title = AppStrings.register;
      case ButtonType.submit:
        title = AppStrings.submit;
      case ButtonType.goToLogin:
        title = AppStrings.goToLogin;
    }
    return FilledButton(
      onPressed: onPressed,
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
        title,
        style: textTheme.labelLarge?.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      customSnackBar({
    required BuildContext context,
    required String content,
  }) {
    final colorScheme = context.theme.colorScheme;

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: AppStrings.close,
          textColor: colorScheme.surface,
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
        ),
        backgroundColor: AppColors.mandatory,
        dismissDirection: DismissDirection.down,
        elevation: 12,
      ),
    );
  }
}
