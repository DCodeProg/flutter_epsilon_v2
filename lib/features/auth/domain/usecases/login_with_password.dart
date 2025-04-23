import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginWithPassword implements UseCase<User, LoginWithPasswordParams> {
  final AuthRepository authRepository;

  LoginWithPassword(this.authRepository);

  @override
  Future<Either<Failure, User>> call(LoginWithPasswordParams params) async {
    return await authRepository.loginWithPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginWithPasswordParams {
  final String email;
  final String password;

  LoginWithPasswordParams({required this.email, required this.password});
}
