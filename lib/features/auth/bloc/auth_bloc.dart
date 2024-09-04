import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController phoneController = TextEditingController();

  AuthBloc() : super(AuthInitial()) {
    on<VerificationNumber>((event, emit) async {
      if (phoneController.text == '911' || phoneController.text.isEmpty) {
        emit(AuthError());
      } else {
        await saveNumber();
        emit(AuthSuccess());
      }
    });
  }

  Future<void> saveNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phoneController.text);
    UserModel().phoneNumber = phoneController.text;
  }
}
