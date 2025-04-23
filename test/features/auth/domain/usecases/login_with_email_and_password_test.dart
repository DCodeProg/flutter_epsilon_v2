import 'package:flutter_epsilon_v2/core/errors/failure.dart';
import 'package:flutter_epsilon_v2/features/auth/domain/entities/user.dart';
import 'package:flutter_epsilon_v2/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_epsilon_v2/features/auth/domain/usecases/login_with_password.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginWithPassword usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginWithPassword(mockAuthRepository);
  });

  final tId = '1';
  final tEmail = 'test@mail.com';
  final tPassword = 'azerty12345';
  final tNom = 'Diallo';
  final tPrenom = 'Georges';
  final tUser = User(id: tId, email: tEmail, nom: tNom, prenom: tPrenom);

  test(
    "should call loginWithPassword on AuthRepository with correct parametters",
    () async {
      // arrange
      when(
        () => mockAuthRepository.loginWithPassword(
          email: tEmail,
          password: tPassword,
        ),
      ).thenAnswer((_) async => Right(tUser));

      // act
      await usecase(
        LoginWithPasswordParams(email: tEmail, password: tPassword),
      );

      // assert
      verify(
        () => mockAuthRepository.loginWithPassword(
          email: tEmail,
          password: tPassword,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test("should get user when login is succesful", () async {
    //arrange
    when(
      () => mockAuthRepository.loginWithPassword(
        email: tEmail,
        password: tPassword,
      ),
    ).thenAnswer((_) async => Right(tUser));

    // act
    final result = await usecase(
      LoginWithPasswordParams(email: tEmail, password: tPassword),
    );

    // assert
    expect(result, equals(Right(tUser)));
    verify(
      () => mockAuthRepository.loginWithPassword(
        email: tEmail,
        password: tPassword,
      ),
    );
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test("should return failure when repository fail", () async {
    // arrange
    final tFailure = ServerFailure(message: "erreur");
    when(
      () => mockAuthRepository.loginWithPassword(
        email: tEmail,
        password: tPassword,
      ),
    ).thenAnswer((_) async => Left(tFailure));

    // act
    final result = await usecase(
      LoginWithPasswordParams(email: tEmail, password: tPassword),
    );

    // assert
    expect(result, equals(Left(tFailure)));
  });
}
