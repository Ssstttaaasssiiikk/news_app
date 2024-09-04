import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/customs/custom_button.dart';
import 'package:news_app/core/customs/custom_text_field.dart';
import 'package:news_app/core/theme/theme.dart';
import 'package:news_app/features/auth/bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              final authBloc = BlocProvider.of<AuthBloc>(context);
              if (state is AuthSuccess) {
                authBloc.phoneController.clear();
                context.go('/news_feed');
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final authBloc = BlocProvider.of<AuthBloc>(context);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Авторизоваться', style: textTheme.displayLarge),
                    const SizedBox(height: 47),
                    Text('Номер телефона (обязательно)',
                        style: textTheme.displayMedium),
                    const SizedBox(height: 9),
                    CustomTextField(controller: authBloc.phoneController),
                    if (state is AuthError) ...[
                      const SizedBox(height: 20),
                      const Text('Ошибка', style: TextStyle(color: Colors.red)),
                    ],
                    const SizedBox(height: 40),
                    Button(
                      text: 'Вход',
                      onPressed: () {
                        authBloc.add(VerificationNumber());
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
