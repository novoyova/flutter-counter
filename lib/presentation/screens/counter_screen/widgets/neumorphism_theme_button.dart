import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/core/constants/app_colors.dart';
import 'package:flutter_counter/logic/cubit/theme_cubit.dart';

class NeumorphismThemeButton extends StatelessWidget {
  const NeumorphismThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        debugPrint('Hello I am here!');
        final themeMode = state.themeMode;
        final baseColor = themeMode == ThemeMode.light
            ? AppColors.lightBackgroundColor
            : AppColors.darkBackgroundColor;
        return GestureDetector(
          onTap: () => context.read<ThemeCubit>().setTheme(
              themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.all(16),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: baseColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: baseColor.darken(0.2),
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: baseColor.lighten(0.15),
                  offset: const Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: themeMode == ThemeMode.light
                ? Icon(
                    Icons.wb_sunny_rounded,
                    color: AppColors.darkAccentColor,
                  )
                : Icon(
                    Icons.brightness_2_rounded,
                    color: AppColors.lightAccentColor,
                  ),
          ),
        );
      },
    );
  }
}
