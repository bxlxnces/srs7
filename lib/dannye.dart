import 'package:dmregister/bloc/print_bloc.dart';
import 'package:dmregister/bloc/print_event.dart';
import 'package:dmregister/bloc/print_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PrintBloc, PrintState>(
          builder: (context, state) {
            if (state is PrintInitial) {
              context.read<PrintBloc>().add(FetchPrint());
              return CircularProgressIndicator();
            } else if (state is PrintLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("User ID: ${state.post.userId}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Post ID: ${state.post.id}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Title: ${state.post.title}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Text("Body: ${state.post.body}",
                      style: TextStyle(fontSize: 14)),
                ],
              );
            } else {
              return Text("Error", style: TextStyle(color: Colors.red));
            }
          },
        ),
      ),
    );
  }
}
