import 'package:dio/dio.dart';
import 'package:dmregister/bloc/cub_event.dart';
import 'package:dmregister/bloc/cub_state.dart';
import 'package:dmregister/flutapi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubBloc extends Bloc<CubEvent, CubState> {
  CubBloc() : super(CubLoading()) {
    final FlutApi client = FlutApi(Dio());

    on<LoadCub>((event, emit) async {
      emit(CubLoading());
      try {
        final posts = await client.getPosts();
        emit(CubLoaded(posts));
      } catch (e) {
        emit(CubError());
      }
    });
  }
}
