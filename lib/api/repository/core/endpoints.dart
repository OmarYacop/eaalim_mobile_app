class Endpoints {
  static String baseUrl = 'https://demo.egensolve.com/api';

  static String studentLogin = '$baseUrl/student-login';
  static String teacherLogin = '$baseUrl/teacher/login';

  static String studentSchedule = '$baseUrl/auth/student-time-table-page';
  static String teacherSchedule = '$baseUrl/teacher/auth/time-table-page';

  static String studentHome = '$baseUrl/auth/student-home-page';
  static String teacherHome = '$baseUrl/teacher/auth/home-page';

  static String teacherCancel = '$baseUrl/teacher/auth/cancel-request';
  static String studentCancel = '$baseUrl/auth/cancel-request';

  static String teacherNotifications = '$baseUrl/teacher/auth/get-requests';
  static String studentNotifications = '$baseUrl/auth/get-requests';

  static String teacherNotificationSeen = '$baseUrl/teacher/auth/set-requests';
  static String studentNotificationsSeen = '$baseUrl/auth/set-requests';

  static String teacherEnterClass = '$baseUrl/teacher/auth/enter-class';
  static String studentEnterClass = '$baseUrl/auth/enter-class';

  static String teacherEndClass = '$baseUrl/teacher/auth/end-class';

  static String teacherAbsent = '$baseUrl/teacher/auth/absent-class';

  static String teacherRefresh = '$baseUrl/teacher/refresh';
  static String studentRefresh = '$baseUrl/refresh';

  static String profile = '$baseUrl/me';
}
