import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/shared/cubit/theme_cubit.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/text_theme.dart';
import 'init_dependencies.dart';

Future<void> main() async {
  await initDependencies();

  runApp(
    BlocProvider(create: (context) => getIt<ThemeCubit>(), child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(
      context,
      "Noto Sans",
      "Bungee",
      "Bungee Outline",
    );
    final MaterialTheme theme = MaterialTheme(textTheme);

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: themeMode,
          home: Scaffold(),
        );
      },
    );
  }
}