import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_epsilon_v2/features/auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Text("Connexion réussi ${state.user.nom}", style: TextTheme.of(context).titleLarge,);
                } else {
                  return Text("Connexion échoué !");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
