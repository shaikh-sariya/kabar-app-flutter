import 'package:news_app/core/constants/imports.dart';

class AppWidgets {
  AppWidgets._();

  static Widget customTextField({
    required BuildContext context,
    required TextFieldType type,
    required TextEditingController controller,
    ValueNotifier<bool>? obscureText,
  }) {
    final textTheme = context.theme.textTheme;
    String text;
    String hintText;

    switch (type) {
      case TextFieldType.username:
        text = AppStrings.userName;
        hintText = AppStrings.enterUsername;
      case TextFieldType.password:
        text = AppStrings.password;
        hintText = AppStrings.enterPassword;
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
                  hintText: hintText,
                  suffixIcon: type == TextFieldType.password
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
}
