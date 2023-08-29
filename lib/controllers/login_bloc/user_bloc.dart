import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_event.dart';
import 'user_state.dart';

class TeacherStudentBlocs
    extends Bloc<TeacherStudentEvent, TeacherStudentState> {
  TeacherStudentBlocs() : super(TeacherStudentState(isTeacher: true)) {
    on<TeacherStudentEvent>(_taped);
  }

  void _taped(TeacherStudentEvent event, Emitter<TeacherStudentState> emit) {
    if (event == TeacherStudentEvent.toggle) {
      final currentState = state;
      emit(TeacherStudentState(
        isTeacher: !currentState.isTeacher,
      ));
    }
  }
}

class LoginBloc extends Bloc<LogInEvent, LogInState> {
  LoginBloc() : super(LogInState(isLogging: false)) {
    on<LogInEvent>(_taped);
  }

  void _taped(LogInEvent event, Emitter<LogInState> emit) {
    if (event == LogInEvent.toggle) {
      final currentState = state;
      emit(LogInState(
        isLogging: !currentState.isLogging,
      ));
    }
  }
}

class CredsBloc extends Bloc<CredsEvent, CredsState> {
  CredsBloc() : super(CredsState(isCredsFalse: false)) {
    on<CredsEvent>(_taped);
  }

  void _taped(CredsEvent event, Emitter<CredsState> emit) {
    emit(CredsState(
      isCredsFalse: event.isCredsFalse,
    ));
  }
}
