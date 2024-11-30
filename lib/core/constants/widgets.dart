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
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
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
              padding: const EdgeInsets.only(top: 8),
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
    ValueNotifier<bool>? valueListenable,
  }) {
    String title;
    String? pressedTitle;

    switch (type) {
      case ButtonType.login:
        title = AppStrings.login;
        pressedTitle = AppStrings.loggingIn;
      case ButtonType.register:
        title = AppStrings.register;
        pressedTitle = AppStrings.registering;
      case ButtonType.submit:
        title = AppStrings.submit;
        pressedTitle = AppStrings.submitting;
      case ButtonType.goToLogin:
        title = AppStrings.goToLogin;
    }
    return ValueListenableBuilder(
      valueListenable: valueListenable ?? ValueNotifier<bool>(false),
      builder: (context, value, child) => FilledButton(
        onPressed: value ? null : onPressed,
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
          value ? (pressedTitle ?? '') : title,
          style: textTheme.labelLarge?.copyWith(
            color: value ? AppColors.body : AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      customSnackBar({
    required BuildContext context,
    required String content,
    bool? success,
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
        backgroundColor:
            success ?? false ? AppColors.success : AppColors.mandatory,
        dismissDirection: DismissDirection.down,
        elevation: 12,
      ),
    );
  }

  static Widget customOTPFields({
    required List<TextEditingController> controllers,
    required List<FocusNode> focusNodes,
    required BuildContext context,
  }) {
    void onChanged(int index, String value) {
      if (value.isNotEmpty && value.length == 1) {
        if (index < controllers.length - 1) {
          focusNodes[index + 1].requestFocus();
        } else {
          FocusScope.of(context).unfocus();
        }
      } else if (value.isEmpty) {
        for (var i = controllers.length - 1; i >= 0; i--) {
          if (controllers[i].text.isNotEmpty) {
            focusNodes[i].requestFocus();
            return;
          }
        }

        focusNodes[0].requestFocus();
      }
    }

    return SizedBox(
      height: 60,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          mainAxisExtent: 60,
          crossAxisSpacing: 8,
        ),
        itemCount: controllers.length,
        itemBuilder: (context, index) => TextFormField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.body),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.mandatory),
            ),
            hintText: '-',
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          onChanged: (value) => onChanged(index, value),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
          onTap: () {
            for (var i = 0; i < controllers.length; i++) {
              if (controllers[i].text.isEmpty) {
                focusNodes[i].requestFocus();
                return;
              }
            }
            focusNodes[controllers.length - 1].requestFocus();
          },
        ),
      ),
    );
  }
}
