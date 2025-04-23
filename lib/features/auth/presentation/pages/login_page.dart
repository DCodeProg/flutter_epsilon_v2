import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_epsilon_v2/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocSelector<AuthBloc, AuthState, AuthState>(
          selector: (state) {
            return state;
            if (state == AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Une erreur")));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Spacer(),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility),
                    ),
                    hintText: "Mot de passe",
                    border: OutlineInputBorder(),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.login),
                  label: Text(
                    "Se connecter",
                    style: TextTheme.of(context).titleMedium,
                  ),
                  style: ButtonStyle(),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    context.replace('/auth/register');
                  },
                  child: Text("Créer un compte"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
