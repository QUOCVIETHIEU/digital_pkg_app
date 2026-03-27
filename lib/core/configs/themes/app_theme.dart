import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../constants/configs.dart';
import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.textFieldColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: Colors.blue,
      secondary: AppColors.secondary,
      brightness: Brightness.light,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    dividerColor: Colors.grey,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: .4,
      indent: 5,
      endIndent: 5,
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      side: BorderSide(width: 1, color: AppColors.borderTextColor),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.borderTextColor),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
    fontFamily: FontFamily.montserrat,
    sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        foregroundColor: AppColors.textColor,
        textStyle: const TextStyle(
          color: AppColors.textColor,
          fontFamily: FontFamily.montserrat,
          fontSize: 12,
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.borderTextColor,
          width: AppConfigs.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.borderTextColor,
          width: AppConfigs.borderWidth,
        ),
      ),
      hintStyle: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textHintColor,
      ),
      labelStyle: TextStyle(fontSize: 12),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        overflow: TextOverflow.ellipsis,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.montserrat,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.montserrat,
        overflow: TextOverflow.ellipsis,
      ),

      titleSmall: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
      ),

      bodySmall: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 10,
        overflow: TextOverflow.ellipsis,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),

      labelLarge: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
      ),
      labelMedium: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.montserrat,
        fontSize: 14,
        overflow: TextOverflow.ellipsis,
      ),
      labelSmall: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.montserrat,
        overflow: TextOverflow.ellipsis,
      ),
      displaySmall: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.montserrat,
        overflow: TextOverflow.ellipsis,
        fontSize: 42.0,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.montserrat,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        fontSize: 14,
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.montserrat,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.textFieldColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: Colors.blue,
      secondary: AppColors.secondary,
      brightness: Brightness.dark,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: FontFamily.montserrat,
    dividerColor: Colors.grey,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: .4,
      indent: 5,
      endIndent: 5,
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      side: BorderSide(width: 1, color: AppColors.borderTextColor),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.borderTextColor),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noOverlay,
      activeTrackColor: const Color(0xffB7B7B7),
      inactiveTrackColor: Colors.grey.withValues(alpha: .3),
      thumbColor: const Color(0xffB7B7B7),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        foregroundColor: AppColors.textColor,
        textStyle: const TextStyle(
          color: AppColors.textColor,
          fontFamily: FontFamily.montserrat,
          fontSize: 12,
        ),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.borderTextColor,
          width: AppConfigs.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.borderTextColor,
          width: AppConfigs.borderWidth,
        ),
      ),
      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
      labelStyle: TextStyle(fontSize: 12, color: Colors.white),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        overflow: TextOverflow.ellipsis,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.montserrat,
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.montserrat,
        overflow: TextOverflow.ellipsis,
      ),

      titleSmall: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
      ),

      bodySmall: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 10,
        overflow: TextOverflow.ellipsis,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textColor,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.montserrat,
        fontSize: 14,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.montserrat,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        fontSize: 14,
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.montserrat,
      ),
    ),
  );
  static CheckboxThemeData headingCheckboxTheme(BuildContext context) =>
      Theme.of(context).checkboxTheme.copyWith(
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const BorderSide(color: AppColors.checkboxColor2, width: 1);
          }
          return const BorderSide(color: AppColors.white, width: 1);
        }),
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.checkboxColor2;
          }
          return Colors.transparent;
        }),
      );
  static CheckboxThemeData checkboxTheme(BuildContext context) =>
      Theme.of(context).checkboxTheme.copyWith(
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const BorderSide(
              color: AppColors.checkboxColor2,
              width: .05,
            );
          }
          if (states.contains(WidgetState.focused)) {
            return const BorderSide(color: Colors.white, width: 1);
          }
          return const BorderSide(color: AppColors.borderTextColor, width: 1);
        }),
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.checkboxColor2; // Bright blue
          }
          return Colors.transparent; // No fill when unchecked
        }),
      );
  static CheckboxThemeData headingCheckboxThemeTwoDimensional(
    BuildContext context,
    bool isSelectedAll,
  ) => Theme.of(context).checkboxTheme.copyWith(
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return BorderSide(
          color: isSelectedAll ? Colors.transparent : Colors.white,
          width: 0.5,
        );
      }
      if (states.contains(WidgetState.focused)) {
        return const BorderSide(color: Colors.white, width: 0.5);
      }
      return const BorderSide(color: Colors.white, width: 0.5);
    }),
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return isSelectedAll ? AppColors.checkboxColor2 : Colors.transparent;
      }
      return Colors.transparent;
    }),
  );
  static TextStyle get styleLabelInput => const TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
    fontFamily: FontFamily.montserrat,
    fontSize: 12.0,
  );
}
