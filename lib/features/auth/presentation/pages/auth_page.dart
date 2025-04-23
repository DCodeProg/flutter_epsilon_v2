import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              ColorScheme.of(context).surfaceContainer,
              ColorScheme.of(context).surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_PageHeader(), Spacer(), _AuthSelection()],
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthSelection extends StatelessWidget {
  const _AuthSelection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton.icon(
          onPressed: () {
            HapticFeedback.selectionClick();
            context.push('/auth/login');
          },
          label: Text("Connexion", style: TextTheme.of(context).titleLarge),
          icon: Icon(Icons.login),
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
          ),
        ),
        SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: () {
            HapticFeedback.selectionClick();
            context.push('/auth/register');
          },
          label: Text("Inscription", style: TextTheme.of(context).titleLarge),
          icon: Icon(Icons.person_add),
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70),
        SizedBox(
          width: 250,
          height: 250,
          child: Image.asset(
            "assets/images/logo_monochrome.png",
            color: ColorScheme.of(context).onSurfaceVariant,
          ),
        ),
        Text("EPSILON", style: TextTheme.of(context).displayLarge),
      ],
    );
  }
}
