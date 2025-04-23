import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> registerNewUser({
    required String email,
    required String password,
    required String nom,
    required String prenom,
  });

  Future<Either<Failure, User>> loginWithPassword({
    required String email,
    required String password,
  });
}
