import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav_event.dart';
import 'bottom_nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(const NavState(index: 0)) {
    on<NavEvent>(_navigate);
  }

  void _navigate(NavEvent event, Emitter<NavState> emit) {
    emit(NavState(
      index: event.index,
    ));
  }
}
