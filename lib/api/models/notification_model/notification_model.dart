class NotificationEntity {
  final int? id;
  final String? status;
  final String? date;
  final String? message;
  final String? seen;
  final String? studentName;
  final String? teacherName;

  const NotificationEntity({
    required this.id,
    required this.status,
    required this.date,
    this.message,
    required this.seen,
    this.studentName,
    this.teacherName,
  });
}
