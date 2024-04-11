import 'package:dmregister/model/photo.dart';

abstract class PhotoState {}

class PhotosInitial extends PhotoState {}

class PhotosLoading extends PhotoState {}

class PhotosLoaded extends PhotoState {
  final List<Album> photos;

  PhotosLoaded(this.photos);
}

class PhotosError extends PhotoState {
  final String message;

  PhotosError(this.message);
}
