import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/app_secrets.dart';
import 'core/shared/cubit/theme_cubit.dart';
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_with_password.dart';
import 'features/auth/domain/usecases/register_new_user.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );

  getIt.registerLazySingleton(() => supabase.client);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  getIt.registerLazySingleton(() => ThemeCubit());

  initAuth();
}

void initAuth() {
  getIt
    // Datasource
    ..registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(getIt()),
    )
    // repositories
    ..registerCachedFactory<AuthRepository>(() => AuthRepositoryImpl(getIt()))
    // usecases
    ..registerFactory<LoginWithPassword>(() => LoginWithPassword(getIt()))
    ..registerFactory<RegisterNewUser>(() => RegisterNewUser(getIt()))
    // bloc
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        loginWithEmailAndPassword: getIt(),
        registerNewUser: getIt(),
      ),
    );
}
