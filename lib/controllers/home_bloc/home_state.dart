part of 'home_bloc.dart';

class HomeState {
  final bool isLoading;
  const HomeState({required this.isLoading});

  HomeState copyWith({bool? isLoading}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
