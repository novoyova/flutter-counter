import 'package:flutter/material.dart';
import 'package:flutter_counter/core/themes/app_theme.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> with HydratedMixin {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light));

  void setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
