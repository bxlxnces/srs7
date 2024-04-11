import 'package:dmregister/api.dart';
import 'package:dmregister/bloc/photo_bloc.dart';
import 'package:dmregister/bloc/photo_event.dart';
import 'package:dmregister/bloc/photo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PhotoBloc(AlbumConnect()),
        child: PhotosPage(),
      ),
    );
  }
}

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<PhotoBloc>().add(LoadPhotos());

    return Scaffold(
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotosLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PhotosLoaded) {
            return ListView.separated(
              itemCount: state.photos.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final photo = state.photos[index];
                return ExpansionTile(
                  title: Text(photo.title),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Album ID: ${photo.albumId}'),
                          Text('Photo ID: ${photo.id}'),
                          Text('Title: ${photo.title}'),
                          Text('URL: ${photo.url}'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is PhotosError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Ошибка. Данные не загрузились'));
        },
      ),
    );
  }
}
