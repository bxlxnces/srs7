import 'package:dmregister/bloc/print_event.dart';
import 'package:dmregister/bloc/print_state.dart';
import 'package:dmregister/dannyeapi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrintBloc extends Bloc<PrintEvent, PrintState> {
  final UserData client;

  PrintBloc(this.client) : super(PrintInitial()) {
    on<FetchPrint>((event, emit) async {
      try {
        final post = await client.getPost();
        emit(PrintLoaded(post));
      } catch (e) {
        emit(PrintError());
      }
    });
  }
}
