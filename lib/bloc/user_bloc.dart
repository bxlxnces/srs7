import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>(_onLoadUser);
    on<SaveUser>(_onSaveUser);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final registered = prefs.getBool('registered') ?? false;
    if (!registered) {
      emit(UserInitial());
      return;
    }
    final name = prefs.getString('name') ?? '';
    final email = prefs.getString('email') ?? '';
    final country = prefs.getString('country') ?? '';
    final phoneNumber = prefs.getString('phoneNumber') ?? '';
    emit(UserLoaded(name, phoneNumber, email, country));
  }

  Future<void> _onSaveUser(SaveUser event, Emitter<UserState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('registered', true);
    await prefs.setString('name', event.name);
    await prefs.setString('phoneNumber', event.phoneNumber);
    await prefs.setString('email', event.email);
    await prefs.setString('country', event.country);
    emit(UserLoaded(event.name, event.phoneNumber, event.email, event.country));
  }
}
