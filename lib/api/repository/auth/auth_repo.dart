import 'package:dio/dio.dart';

import '../../data/fetched_user_data.dart';
import '../../models/requests/requests.dart';
import '../../utils/dio_client/dio_client.dart';
import '../core/endpoints.dart';
import 'base_auth_repo.dart';

class AuthRepository extends BaseAuthRepo {
  AuthRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  final Dio _dioClient;

  @override
  Future<Map> login(LoginRequest request, bool isTeacher) async {
    final response = await _dioClient.post(
        isTeacher ? Endpoints.teacherLogin : Endpoints.studentLogin,
        data: request.toJson());
    return response.data;
  }

  @override
  void logout() {
    UserData.removeData();
  }

  @override
  Future<String?> refresh(RefreshRequest request) async {
    final response = await _dioClient.post(
        UserData.isTeacher!
            ? Endpoints.teacherRefresh
            : Endpoints.studentRefresh,
        data: request.toJson());
    return response.data;
  }
}
