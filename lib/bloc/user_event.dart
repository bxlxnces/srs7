part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {}

class SaveUser extends UserEvent {
  final String name, phoneNumber, email, country;

  const SaveUser(this.name, this.phoneNumber, this.email, this.country);

  @override
  List<Object> get props => [name, phoneNumber, email, country];
}
