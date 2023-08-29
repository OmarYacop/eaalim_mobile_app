part of 'welcome_bloc.dart';

class WelcomeState {
  final int index;
  const WelcomeState({required this.index});

  WelcomeState copyWith({int? index}) {
    return WelcomeState(
      index: index ?? this.index,
    );
  }
}
