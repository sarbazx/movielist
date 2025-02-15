import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/cubit/app_theme_cubit.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => context.read<AppThemeCubit>().toggleTheme(),
          icon: state.theme == AppThemeLight().theme
              ? Icon(
                  Icons.sunny,
                  size: 24,
                  color: Colors.amber,
                )
              : Icon(
                  Icons.star,
                  size: 24,
                  color: Colors.white,
                ),
        );
      },
    );
  }
}
