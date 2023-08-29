import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'common/services/notification_service.dart';
import 'common/services/secure_storage.dart';

class Global {
  static bool? darkMode;
  static String? username;
  static String? password;
  static bool? isFirstTime;
  static String? lastSignInType;
  static int unreadNotifications = 0;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getTemporaryDirectory());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    NotificationService().initNotification();
    await loadData();
  }

  static loadData() async {
    darkMode = (await UserSecureStorage.loadVariable('darkMode')) == 'true'
        ? true
        : (await UserSecureStorage.loadVariable('darkMode')) == null
            ? false
            : false;
    isFirstTime = (await UserSecureStorage.loadVariable('isFirstTime')) != null
        ? true
        : false;
    username = await UserSecureStorage.loadVariable('username');
    password = await UserSecureStorage.loadVariable('password');
    lastSignInType = await UserSecureStorage.loadVariable('lastSignInType');
  }
}
