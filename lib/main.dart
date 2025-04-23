import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/router/app_router.dart';
import 'core/shared/cubit/theme_cubit.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/text_theme.dart';
import 'init_dependencies.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initDependencies();

  runApp(
    BlocProvider(create: (context) => getIt<ThemeCubit>(), child: MainApp()),
  );

  FlutterNativeSplash.remove();
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

    FlutterNativeSplash.remove();

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: themeMode,
          routerConfig: appRouter,
        );
      },
    );
  }
}
