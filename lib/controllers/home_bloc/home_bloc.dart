import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(isLoading: true)) {
    on<HomeEvent>(_load);
  }

  void _load(HomeEvent event, Emitter<HomeState> emit) {
    emit(HomeState(
      isLoading: event.isLoading,
    ));
  }
}
