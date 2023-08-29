part of 'notifications_bloc.dart';

class NotificationState {
  final bool isLoading;
  const NotificationState({required this.isLoading});

  NotificationState copyWith({bool? isLoading}) {
    return NotificationState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class CounterState {
  final int unreadNotifications;
  const CounterState({required this.unreadNotifications});

  CounterState copyWith({int? unreadNotifications}) {
    return CounterState(
      unreadNotifications: unreadNotifications ?? this.unreadNotifications,
    );
  }
}
