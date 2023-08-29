class DaysState {
  final String days;

  const DaysState({required this.days});
}

class LoadState {
  final bool isLoading;
  const LoadState({required this.isLoading});
  LoadState copyWith({bool? isLoading}) {
    return LoadState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
