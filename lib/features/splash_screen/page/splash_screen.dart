import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/splash_screen/bloc/splash_screen_bloc.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc()..add(CheckNumber()),
      child: BlocConsumer<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          Future.delayed(const Duration(seconds: 3), () {
            if (state is HaveNumber) {
              context.go('/news_feed');
            } else if (state is NotHaveNumber) {
              context.go('/auth');
            }
          });
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/image/1.png'),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
