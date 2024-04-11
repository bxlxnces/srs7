import 'package:dmregister/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'photo_event.dart';
import 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final AlbumConnect albumApi;

  PhotoBloc(this.albumApi) : super(PhotosInitial()) {
    on<LoadPhotos>((event, emit) async {
      emit(PhotosLoading());
      try {
        final photos = await albumApi.fetchPhotos();
        emit(PhotosLoaded(photos));
      } catch (e) {
        emit(PhotosError(e.toString()));
      }
    });
  }
}
