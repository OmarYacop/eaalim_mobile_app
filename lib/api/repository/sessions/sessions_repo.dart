import 'dart:io';

import 'package:dio/dio.dart';

import '../../models/requests/absent_request/absent_request.dart';
import '../../models/requests/cancel_request/cancel_request.dart';
import '../../models/requests/end_request/end_request.dart';
import '../../models/requests/enter_request/enter_request.dart';
import '../../models/requests/sessions_request/sessions_request.dart';
import '../../utils/dio_client/dio_client.dart';
import '../core/endpoints.dart';
import 'base_sessions_repo.dart';

class SessionsRepository extends BaseSessionsRepo {
  SessionsRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  final Dio _dioClient;

  @override
  Future<dynamic> getSessions(
      SessionsRequest request, bool isTeacher, String referredPage) async {
    final response = await _dioClient.get(
        referredPage == 'home'
            ? isTeacher
                ? Endpoints.teacherHome
                : Endpoints.studentHome
            : isTeacher
                ? Endpoints.teacherSchedule
                : Endpoints.studentSchedule,
        options:
            Options(headers: {'Authorization': 'Bearer ${request.token}'}));
    return response.data;
  }

  @override
  Future cancelSession(CancelRequest request, bool isTeacher) async {
    final response = await _dioClient.post(
        isTeacher ? Endpoints.teacherCancel : Endpoints.studentCancel,
        data: request.toJson(),
        options:
            Options(headers: {'Authorization': 'Bearer ${request.token}'}));
    return response.data;
  }

  @override
  Future enterSession(EnterRequest request, bool isTeacher) async {
    final response = await _dioClient.post(
        isTeacher ? Endpoints.teacherEnterClass : Endpoints.studentEnterClass,
        data: request.toJson(),
        options:
            Options(headers: {'Authorization': 'Bearer ${request.token}'}));
    return response.data;
  }

  @override
  Future absentStudent(AbsentRequest request) async {
    File file = File(request.video!);
    MultipartFile multipartFile = await MultipartFile.fromFile(
      request.video!,
      filename: file.path.split('/').last,
    );
    FormData formData = FormData.fromMap({
      'class_id': request.class_id,
      'notes': request.note,
      'video': multipartFile
    });
    final response = await _dioClient.post(Endpoints.teacherAbsent,
        data: formData,
        options:
            Options(headers: {'Authorization': 'Bearer ${request.token}'}));
    return response.data;
  }

  @override
  Future endClass(EndRequest request) async {
    if (request.images != null) {
      List<MultipartFile> imageFiles = [];
      for (String filePath in request.images!) {
        File file = File(filePath);
        MultipartFile multipartFile = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        );
        imageFiles.add(multipartFile);
      }

      FormData formData = FormData.fromMap({
        'class_id': request.class_id,
        'homework': request.homework,
        'notes': request.notes,
        'summary': request.summary,
        'images[]': imageFiles
      });

      final response = await _dioClient.post(Endpoints.teacherEndClass,
          data: formData,
          options:
              Options(headers: {'Authorization': 'Bearer ${request.token}'}));
      return response.data;
    }

    final response = await _dioClient.post(Endpoints.teacherEndClass,
        data: request.toJson(),
        options:
            Options(headers: {'Authorization': 'Bearer ${request.token}'}));
    return response.data;
  }
}
