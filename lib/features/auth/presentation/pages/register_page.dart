import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_epsilon_v2/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void registerUser() {
      context.read<AuthBloc>().add(
        AuthRegisterNewUserEvent(
          email: emailController.text,
          password: passwordController.text,
          nom: nomController.text,
          prenom: prenomController.text,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Inscription")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocSelector<AuthBloc, AuthState, AuthState>(
          selector: (state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Une erreur : ${state.message}")));
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
                  controller: nomController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Nom",
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: prenomController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Prénom",
                    border: OutlineInputBorder(),
                  ),
                ),
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
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility),
                    ),
                    hintText: "Confirmer le mot de passe",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(),
                OutlinedButton.icon(
                  onPressed: () => registerUser(),
                  icon: Icon(Icons.person_add),
                  label: Text(
                    "S'inscrire",
                    style: TextTheme.of(context).titleMedium,
                  ),
                  style: ButtonStyle(),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    context.replace('/auth/login');
                  },
                  child: Text("Se connecter"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
