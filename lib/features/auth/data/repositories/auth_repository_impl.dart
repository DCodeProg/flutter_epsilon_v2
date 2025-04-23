import 'package:flutter_epsilon_v2/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, User>> loginWithPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> registerNewUser({
    required String email,
    required String password,
    required String nom,
    required String prenom,
  }) async {
    try {
      return Right(
        await authRemoteDatasource.registerNewUser(
          email: email,
          password: password,
          nom: nom,
          prenom: prenom,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
