part of 'notifications_bloc.dart';

class NotificationsEvent {
  final bool isLoading;
  const NotificationsEvent({required this.isLoading});
}

class CounterEvent {
  final int unreadNotifications;
  const CounterEvent({required this.unreadNotifications});
}
