import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_event.dart';
import 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Initial()) {
    on<FetchData>((event, emit) async {
      emit(Loading());
      await Future.delayed(const Duration(seconds: 2));
      emit(Success());
    });
  }
}
