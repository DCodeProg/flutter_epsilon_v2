import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_epsilon_v2/core/errors/failure.dart';
import 'package:flutter_epsilon_v2/features/auth/domain/entities/user.dart';
import 'package:flutter_epsilon_v2/features/auth/domain/usecases/login_with_password.dart';
import 'package:flutter_epsilon_v2/features/auth/domain/usecases/register_new_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithPassword _loginWithEmailAndPassword;
  final RegisterNewUser _registerNewUser;

  AuthBloc({
    required LoginWithPassword loginWithEmailAndPassword,
    required RegisterNewUser registerNewUser,
  }) : _loginWithEmailAndPassword = loginWithEmailAndPassword,
       _registerNewUser = registerNewUser,
       super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthLoading());
    });
    on<AuthLoginWithEmailAndPasswordEvent>(
      (event, emit) => _onLoginWithPasswordEvent(event, emit),
    );
    on<AuthRegisterNewUserEvent>(
      (event, emit) => _onRegisterNewUserEvent(event, emit),
    );
  }

  Future<void> _onLoginWithPasswordEvent(
    AuthLoginWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    final result = await _loginWithEmailAndPassword(
      LoginWithPasswordParams(email: event.email, password: event.password),
    );

    result.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => AuthSuccess(user: r),
    );
  }

  Future<void> _onRegisterNewUserEvent(
    AuthRegisterNewUserEvent event,
    Emitter emit,
  ) async {
    final result = await _registerNewUser(
      RegisterNewUserParams(
        nom: event.nom,
        prenom: event.prenom,
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => AuthSuccess(user: r),
    );
  }
}
