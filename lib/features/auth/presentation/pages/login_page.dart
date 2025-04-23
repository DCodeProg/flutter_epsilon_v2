import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_epsilon_v2/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void loginUser() {
      context.read<AuthBloc>().add(
        AuthLoginWithEmailAndPasswordEvent(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocSelector<AuthBloc, AuthState, AuthState>(
          selector: (state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Une erreur : ${state.message}")),
              );
            }
            if (state is AuthSuccess) {
              context.go('/home');
            }
            return state;
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Spacer(),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: passwordController,
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
                  onPressed: () => loginUser(),
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
