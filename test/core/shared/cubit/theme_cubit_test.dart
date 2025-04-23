import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_epsilon_v2/core/shared/cubit/theme_cubit.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late ThemeCubit themeCubit;
  late MockStorage mockStorage;

  setUp(() {
    mockStorage = MockStorage();
    HydratedBloc.storage = mockStorage;
    when(
      () => mockStorage.write(any(), any()),
    ).thenAnswer((_) async => Future.value());
    themeCubit = ThemeCubit();
  });

  tearDown(() {
    themeCubit.close();
  });

  test('should initial state is ThemeMode.system', () {
    // assert
    expect(themeCubit.state, equals(ThemeMode.system));
  });

  test('should saves state to storage on state change', () {
    // arrange
    themeCubit.emit(ThemeMode.dark);

    // act
    themeCubit.toggleThemeMode();

    // assert
    verify(
      () => mockStorage.write('ThemeCubit', {
        'theme_mode': ThemeMode.light.index,
      }),
    ).called(1);
  });

  test("should retrieve last stored theme mode when the app launch", () {
    // arrange
    when(
      () => mockStorage.read('ThemeCubit'),
    ).thenReturn({'theme_mode': ThemeMode.dark.index});

    // act
    final themeCubit = ThemeCubit();

    // assert
    expect(themeCubit.state, equals(ThemeMode.dark));
    verify(() => mockStorage.read('ThemeCubit'));
  });

  group("systemBrightness", () {
    test("should return Brightness.light if system is in light mode", () {
      // arrange
      final binding = TestWidgetsFlutterBinding.ensureInitialized();
      binding.platformDispatcher.platformBrightnessTestValue = Brightness.light;

      // act
      final res = themeCubit.systemBrightness;

      // assert
      expect(res, equals(Brightness.light));
    });

    test("should return Brightness.dark if system is in dark mode", () {
      // arrange
      final binding = TestWidgetsFlutterBinding.ensureInitialized();
      binding.platformDispatcher.platformBrightnessTestValue = Brightness.dark;

      // act
      final res = themeCubit.systemBrightness;

      // assert
      expect(res, equals(Brightness.dark));
    });
  });

  group("toogleThemeMode", () {
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

    test(
      'should emits ThemeMode.light when toggling from ThemeMode.system when the system is in dark mode',
      () {
        // arrange
        final binding = TestWidgetsFlutterBinding.ensureInitialized();
        binding.platformDispatcher.platformBrightnessTestValue =
            Brightness.dark;
        themeCubit.emit(ThemeMode.system);

        // act
        themeCubit.toggleThemeMode();

        // assert
        expect(themeCubit.state, equals(ThemeMode.light));
      },
    );

    test(
      'should emits ThemeMode.dark when toggling from ThemeMode.system when the system is in light mode',
      () {
        // arrange
        final binding = TestWidgetsFlutterBinding.ensureInitialized();
        binding.platformDispatcher.platformBrightnessTestValue =
            Brightness.light;
        themeCubit.emit(ThemeMode.system);

        // act
        themeCubit.toggleThemeMode();

        // assert
        expect(themeCubit.state, equals(ThemeMode.dark));
      },
    );
  });

  group("selectThemeMode", () {
    test('should emits ThemeMode.light when selecting ThemeMode.light', () {
      // act
      themeCubit.selectThemeMode(ThemeMode.light);

      // assert
      expect(themeCubit.state, equals(ThemeMode.light));
    });

    test('should emits ThemeMode.dark when selecting ThemeMode.dark', () {
      // act
      themeCubit.selectThemeMode(ThemeMode.dark);

      // assert
      expect(themeCubit.state, equals(ThemeMode.dark));
    });

    test('should emits ThemeMode.system when selecting ThemeMode.system', () {
      // act
      themeCubit.selectThemeMode(ThemeMode.system);

      // assert
      expect(themeCubit.state, equals(ThemeMode.system));
    });
  });
}
