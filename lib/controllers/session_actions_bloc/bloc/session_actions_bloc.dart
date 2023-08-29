import 'package:flutter_bloc/flutter_bloc.dart';

part 'session_actions_event.dart';
part 'session_actions_state.dart';

class CancelBloc extends Bloc<CancelEvent, CancelState> {
  CancelBloc() : super(CancelState(selectedOption: 2)) {
    on<CancelEvent>(_setOption);
  }

  void _setOption(CancelEvent event, Emitter<CancelState> emit) {
    emit(CancelState(
      selectedOption: event.selectedOption,
    ));
  }
}

class EndBloc extends Bloc<UploadEvent, EndState> {
  EndBloc() : super(EndState(filesPaths: [])) {
    on<UploadEvent>(_chooseFiles);
  }

  void _chooseFiles(UploadEvent event, Emitter<EndState> emit) {
    emit(EndState(
      filesPaths: event.filesPaths,
    ));
  }
}

class AbsentBloc extends Bloc<UploadEvent, EndState> {
  AbsentBloc() : super(EndState(filesPaths: [])) {
    on<UploadEvent>(_chooseFile);
  }

  void _chooseFile(UploadEvent event, Emitter<EndState> emit) {
    emit(EndState(
      filesPaths: event.filesPaths,
    ));
  }
}

class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc() : super(SendState(isLoading: false)) {
    on<SendEvent>(_load);
  }

  void _load(SendEvent event, Emitter<SendState> emit) {
    emit(SendState(
      isLoading: event.isLoading,
    ));
  }
}
