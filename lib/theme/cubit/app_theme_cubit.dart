import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeLight());

  void toggleTheme() {
    emit(state.theme == AppThemeLight().theme
        ? AppThemeDark()
        : AppThemeLight());
  }
}
