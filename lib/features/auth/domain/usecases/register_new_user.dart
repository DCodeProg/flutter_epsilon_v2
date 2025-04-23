import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterNewUser implements UseCase<User, RegisterNewUserParams> {
  final AuthRepository authRepository;

  RegisterNewUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(RegisterNewUserParams params) async {
    return await authRepository.registerNewUser(
      email: params.email,
      password: params.password,
      nom: params.nom,
      prenom: params.prenom,
    );
  }
}

class RegisterNewUserParams {
  final String email;
  final String password;
  final String nom;
  final String prenom;

  RegisterNewUserParams({
    required this.email,
    required this.password,
    required this.nom,
    required this.prenom,
  });
}
