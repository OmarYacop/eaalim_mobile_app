import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<SwipeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState(index: 0)) {
    on<SwipeEvent>(_swipe);
  }

  void _swipe(SwipeEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeState(
      index: event.index,
    ));
  }
}
