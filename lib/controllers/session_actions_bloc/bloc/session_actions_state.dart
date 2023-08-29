part of 'session_actions_bloc.dart';

class EndState {
  final List<String> filesPaths;
  EndState({required this.filesPaths});
  EndState copyWith({List<String>? filesPaths}) {
    return EndState(
      filesPaths: filesPaths ?? this.filesPaths,
    );
  }
}

class CancelState {
  final int selectedOption;
  CancelState({required this.selectedOption});
  CancelState copyWith({int? selectedOption}) {
    return CancelState(
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}

class SendState {
  final bool isLoading;
  SendState({required this.isLoading});
  SendState copyWith({bool? isLoading}) {
    return SendState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
