import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/user_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserModel> registerNewUser({
    required String email,
    required String password,
    required String nom,
    required String prenom,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;

  AuthRemoteDatasourceImpl(this.supabaseClient);

  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return UserModel.fromMap(response.user!.toJson());
  }

  @override
  Future<UserModel> registerNewUser({
    required String email,
    required String password,
    required String nom,
    required String prenom,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {"firstname": prenom, "lastname": nom},
    );
    final user = response.user!;
    return UserModel(
      id: user.id,
      email: user.email!,
      nom: user.userMetadata!['lastname'],
      prenom: user.userMetadata!['firstname'],
    );
  }
}
