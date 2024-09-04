import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<Logout>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('phone');
      emit(LogoutSuccess());
    });
  }
}
