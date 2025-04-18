import 'package:flutter/material.dart';
import 'package:flutter_epsilon_v2/core/shared/cubit/theme_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late ThemeCubit themeCubit;
  late MockStorage mockStorage;

  setUp(() {
    mockStorage = MockStorage();
    HydratedBloc.storage = mockStorage;
    when(() => mockStorage.write(any(), any())).thenAnswer((_) async => Future.value());
    themeCubit = ThemeCubit();
  });

  tearDown(() {
    themeCubit.close();
  });

  test('should initial state is ThemeMode.system', () {
    // assert
    expect(themeCubit.state, equals(ThemeMode.system));
  });

  test('should emits ThemeMode.light when toggling from ThemeMode.dark', () {
    // arrange
    themeCubit.emit(ThemeMode.dark);

    // act
    themeCubit.toggleThemeMode();

    // assert
    expect(themeCubit.state, equals(ThemeMode.light));
  });

  test('should emits ThemeMode.dark when toggling from ThemeMode.light', () {
    // arrange
    themeCubit.emit(ThemeMode.light);

    // act
    themeCubit.toggleThemeMode();

    // assert
    expect(themeCubit.state, equals(ThemeMode.dark));
  });

  test('should emits selected ThemeMode when using selectThemeMode', () {
    // act
    themeCubit.selectThemeMode(ThemeMode.light);

    // assert
    expect(themeCubit.state, equals(ThemeMode.light));
  });

  test('should persists state correctly in storage', () {
    // arrange
    when(() => mockStorage.read('ThemeCubit')).thenReturn({'theme_mode': ThemeMode.dark.index});
    themeCubit = ThemeCubit();

    // assert
    expect(themeCubit.state, equals(ThemeMode.dark));
  });

  test('should saves state to storage on state change', () {
    // act
    themeCubit.selectThemeMode(ThemeMode.light);
    
    // assert
    verify(() => mockStorage.write('ThemeCubit', {'theme_mode': ThemeMode.light.index})).called(1);
  });
}