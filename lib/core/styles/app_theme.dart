import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      error: AppColors.red,
    ),
    appBarTheme: const AppBarTheme(color: AppColors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      isDense: true,
      alignLabelWithHint: true,
      hintStyle: const TextStyle(
        fontSize: 14.0,
        height: 24 / 14,
        color: Color(0xFF747688),
      ),
      labelStyle: const TextStyle(
        fontSize: 14.0,
        height: 24 / 14,
        color: Color(0xFF747688),
      ),
      floatingLabelStyle: const TextStyle(
        fontSize: 14.0,
        color: AppColors.primary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.red),
      ),
      disabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
    ),
    checkboxTheme: _checkboxThemeData(),
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: TextStyle(
          color: Color(0xFF888693),
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          height: 25.0 / 15.0),
      labelStyle: TextStyle(
          color: Color(0xFF888693),
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          height: 25.0 / 15.0),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.gray),
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
    radioTheme:
        RadioThemeData(fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primary;
      }
      return AppColors.gray;
    })),
    datePickerTheme: DatePickerThemeData(
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return Colors.transparent;
      }),
      todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return Colors.transparent;
      }),
      todayBorder: const BorderSide(color: AppColors.gray, width: 1),
      dayShape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      dayStyle: TextStyle(),
      yearStyle: TextStyle(),
      headerHeadlineStyle: TextStyle(),
    ),
    switchTheme: SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      trackOutlineColor: WidgetStateProperty.all(AppColors.gray),
      thumbColor: WidgetStateProperty.all(AppColors.white),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.gray;
      }),
    )
  );
}

CheckboxThemeData _checkboxThemeData() => CheckboxThemeData(
    shape: CircleBorder(
      side: WidgetStateBorderSide.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return const BorderSide(
              width: 2,
              color: Colors.transparent,
            );
          }
          return BorderSide(
            width: 2,
            color: Colors.transparent,
          );
        },
      ),
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.primary;
      } else if (states.contains(WidgetState.dragged)) {
        return AppColors.primary;
      } else if (states.contains(WidgetState.error)) {
        return AppColors.primary;
      } else if (states.contains(WidgetState.focused)) {
        return AppColors.primary;
      } else if (states.contains(WidgetState.hovered)) {
        return AppColors.primary;
      } else if (states.contains(WidgetState.pressed)) {
        return AppColors.primary;
      } else if (states.contains(WidgetState.scrolledUnder)) {
        return AppColors.primary;
      } else if (states.contains(WidgetState.selected)) {
        return AppColors.primary;
      }
      return AppColors.gray;
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.white;
      } else if (states.contains(WidgetState.dragged)) {
        return AppColors.white;
      } else if (states.contains(WidgetState.error)) {
        return AppColors.white;
      } else if (states.contains(WidgetState.focused)) {
        return AppColors.white;
      } else if (states.contains(WidgetState.hovered)) {
        return AppColors.white;
      } else if (states.contains(WidgetState.pressed)) {
        return AppColors.white;
      } else if (states.contains(WidgetState.scrolledUnder)) {
        return AppColors.white;
      } else if (states.contains(WidgetState.selected)) {
        return AppColors.white;
      }
      return AppColors.white;
    }),
    side: WidgetStateBorderSide.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return const BorderSide(
            width: 2,
            color: Colors.transparent,
          );
        }
        return BorderSide(
          width: 2,
          color: Colors.transparent,
        );
      },
    ),
    visualDensity: VisualDensity.compact);
