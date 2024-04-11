import 'package:dmregister/bloc/cub_bloc.dart';
import 'package:dmregister/bloc/cub_event.dart';
import 'package:dmregister/bloc/cub_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CubBloc()..add(LoadCub()),
        child: BlocBuilder<CubBloc, CubState>(
          builder: (context, state) {
            if (state is CubLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CubLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index].title),
                    subtitle: Text(state.posts[index].body),
                  );
                },
              );
            } else if (state is CubError) {
              return Center(
                child: Text('Failed to load posts'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
