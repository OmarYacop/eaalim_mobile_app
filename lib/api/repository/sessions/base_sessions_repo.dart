import '../../models/requests/requests.dart';

abstract class BaseSessionsRepo {
  Future<dynamic> getSessions(
      SessionsRequest request, bool isTeacher, String referredPage);
  Future<dynamic> cancelSession(CancelRequest request, bool isTeacher);
  Future<dynamic> enterSession(EnterRequest request, bool isTeacher);
  Future<dynamic> absentStudent(AbsentRequest request);
  Future<dynamic> endClass(EndRequest request);
}
