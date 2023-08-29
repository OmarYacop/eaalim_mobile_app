import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'days_of_week_event.dart';
import 'days_of_week_state.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {
  DaysBloc()
      : super(DaysState(days: DateFormat.EEEE().format(DateTime.now()))) {
    on<SelectDayEvent>(_selectDayEvent);
  }

  void _selectDayEvent(SelectDayEvent event, Emitter<DaysState> emit) {
    emit(DaysState(days: event.day));
  }
}

class LoadBloc extends Bloc<LoadEvent, LoadState> {
  LoadBloc() : super(const LoadState(isLoading: true)) {
    on<LoadEvent>(_load);
  }

  void _load(LoadEvent event, Emitter<LoadState> emit) {
    emit(LoadState(
      isLoading: event.isLoading,
    ));
  }
}
