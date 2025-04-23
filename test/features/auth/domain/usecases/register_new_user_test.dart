import 'package:flutter_epsilon_v2/core/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_epsilon_v2/features/auth/domain/entities/user.dart';
import 'package:flutter_epsilon_v2/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_epsilon_v2/features/auth/domain/usecases/register_new_user.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late RegisterNewUser usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = RegisterNewUser(mockAuthRepository);
  });

  const String tId = '00000000-0000-0000-0000-000000000000';
  const String tEmail = "john.doe@example.com";
  const String tPassword = "J0hnD03*95";
  const String tNom = "John";
  const String tPrenom = "Doe";

  const tUser = User(id: tId, email: tEmail, nom: tNom, prenom: tPrenom);

  final tUserParams = RegisterNewUserParams(
    email: tEmail,
    password: tPassword,
    nom: tNom,
    prenom: tPrenom,
  );

  test(
    "should call registerNewUser on AuthRepository with correct parametters",
    () async {
      // arrange
      when(
        () => mockAuthRepository.registerNewUser(
          email: tEmail,
          password: tPassword,
          nom: tNom,
          prenom: tPrenom,
        ),
      ).thenAnswer((_) async => Right(tUser));

      // act
      await usecase(tUserParams);

      // assert
      verify(
        () => mockAuthRepository.registerNewUser(
          email: tEmail,
          password: tPassword,
          nom: tNom,
          prenom: tPrenom,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test("should return a user when repository success", () async {
    // arrange
    when(
      () => mockAuthRepository.registerNewUser(
        email: tEmail,
        password: tPassword,
        nom: tNom,
        prenom: tPrenom,
      ),
    ).thenAnswer((_) async => Right(tUser));

    // act
    final result = await usecase(tUserParams);

    // assert
    expect(result, equals(Right(tUser)));
  });

  test("should return failure when repository fail", () async {
    // arrange
    final tFailure = ServerFailure(message: "erreur");
    when(
      () => mockAuthRepository.registerNewUser(
        email: tEmail,
        password: tPassword,
        nom: tNom,
        prenom: tPrenom,
      ),
    ).thenAnswer((_) async => Left(tFailure));

    // act
    final result = await usecase(tUserParams);

    // assert
    expect(result, equals(Left(tFailure)));
  });
}
