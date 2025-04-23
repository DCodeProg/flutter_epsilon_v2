part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginWithEmailAndPasswordEvent({required this.email, required this.password});
}

class AuthRegisterNewUserEvent extends AuthEvent {
  final String email;
  final String password;
  final String nom;
  final String prenom;

  const AuthRegisterNewUserEvent({
    required this.email,
    required this.password,
    required this.nom,
    required this.prenom,
  });
}
