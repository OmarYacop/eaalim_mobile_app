import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationState> {
  NotificationsBloc() : super(const NotificationState(isLoading: true)) {
    on<NotificationsEvent>(_updateNotifications);
  }

  void _updateNotifications(
      NotificationsEvent event, Emitter<NotificationState> emit) {
    emit(NotificationState(
      isLoading: event.isLoading,
    ));
  }
}

class NotificationsCounterBloc extends Bloc<CounterEvent, CounterState> {
  NotificationsCounterBloc()
      : super(const CounterState(unreadNotifications: 0)) {
    on<CounterEvent>(_updateCounter);
  }

  void _updateCounter(CounterEvent event, Emitter<CounterState> emit) {
    emit(CounterState(
      unreadNotifications: event.unreadNotifications,
    ));
  }
}
