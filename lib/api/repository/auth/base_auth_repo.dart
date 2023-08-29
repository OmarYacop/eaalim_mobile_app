import '../../models/requests/requests.dart';

abstract class BaseAuthRepo {
  Future<Map> login(LoginRequest request, bool isTeacher);

  void logout();

  Future<String?> refresh(RefreshRequest request); 
}
