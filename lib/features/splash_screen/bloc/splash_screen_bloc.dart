import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_screen_state.dart';
part 'splash_screen_event.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<CheckNumber>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      bool hasPhone = prefs.containsKey('phone');

      if (hasPhone) {
        emit(HaveNumber());
      } else {
        emit(NotHaveNumber());
      }
    });
  }
}
