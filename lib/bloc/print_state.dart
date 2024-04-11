import 'package:dmregister/model/dannye.dart';

abstract class PrintState {}

class PrintInitial extends PrintState {}

class PrintLoaded extends PrintState {
  final Dannye post;
  PrintLoaded(this.post);
}

class PrintError extends PrintState {}
