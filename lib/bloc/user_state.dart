part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final String name, phoneNumber, email, country;

  const UserLoaded(this.name, this.phoneNumber, this.email, this.country);

  @override
  List<Object> get props => [name, phoneNumber, email, country];
}
