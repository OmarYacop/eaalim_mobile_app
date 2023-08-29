enum TeacherStudentEvent { toggle }

enum LogInEvent { toggle }

class CredsEvent {
  final bool isCredsFalse;
  const CredsEvent(this.isCredsFalse);
}
