import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String nom;
  final String prenom;

  const User({
    required this.id,
    required this.email,
    required this.nom,
    required this.prenom,
  });

  @override
  List<Object> get props => [id, email, nom, prenom];

  @override
  bool get stringify => true;
}
