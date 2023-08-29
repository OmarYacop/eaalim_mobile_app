class CredsState {
  final bool isCredsFalse;

  CredsState({required this.isCredsFalse});

  CredsState copyWith({bool? isCredsFalse}) {
    return CredsState(
      isCredsFalse: isCredsFalse ?? this.isCredsFalse,
    );
  }
}

class TeacherStudentState {
  final bool isTeacher;

  TeacherStudentState({required this.isTeacher});

  TeacherStudentState copyWith({bool? isTeacher}) {
    return TeacherStudentState(
      isTeacher: isTeacher ?? this.isTeacher,
    );
  }
}

class LogInState {
  final bool isLogging;

  LogInState({required this.isLogging});

  LogInState copyWith({bool? isLogging}) {
    return LogInState(isLogging: isLogging ?? this.isLogging);
  }
}
