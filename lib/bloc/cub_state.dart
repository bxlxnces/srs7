import 'package:dmregister/model/flut.dart';

abstract class CubState {}

class CubLoading extends CubState {}

class CubLoaded extends CubState {
  final List<Flut> posts;
  CubLoaded(this.posts);
}

class CubError extends CubState {}
