import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/customs/custom_button.dart';
import 'package:news_app/core/theme/color.dart';
import 'package:news_app/core/theme/theme.dart';
import 'package:news_app/features/auth/model/user_model.dart';
import 'package:news_app/features/profile/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNumber = UserModel().phoneNumber;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.gray3,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/news_feed'),
        ),
        title: Text(
          'Профиль',
          style: textTheme.displayMedium,
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            context.go('/auth');
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Номер телефона', style: textTheme.displayMedium),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration:
                      const BoxDecoration(color: CustomColors.lightGray),
                  child: Text(phoneNumber, style: textTheme.displayMedium),
                ),
                const SizedBox(height: 50),
                Button(
                  text: 'Выход',
                  onPressed: () {
                    context.read<ProfileBloc>().add(Logout());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
