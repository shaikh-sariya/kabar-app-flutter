import 'package:flutter/material.dart';
import 'package:news_app/core/constants/colors.dart';
import 'package:news_app/core/theme/typography.dart';

class AppTheme {
  const AppTheme._();

  static final theme = ThemeData(
    colorSchemeSeed: AppColors.primary,
    useMaterial3: true,
    textTheme: AppTextTheme.textTheme,
  );
}
