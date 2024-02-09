import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData theme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    textTheme: GoogleFonts.robotoMonoTextTheme(),
  );
}
