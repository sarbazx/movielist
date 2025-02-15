part of 'app_theme_cubit.dart';

sealed class AppThemeState {
  final ThemeMode theme;

  const AppThemeState({required this.theme});
}

final class AppThemeLight extends AppThemeState {
  AppThemeLight() : super(theme: ThemeMode.light);
}

final class AppThemeDark extends AppThemeState {
  AppThemeDark() : super(theme: ThemeMode.dark);
}
