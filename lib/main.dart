import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/repository/repos.dart';
import 'common/routes/pages_route_bloc.dart';
import 'controllers/notifications_cubit/notifications_cubit.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => SessionsRepository()),
        RepositoryProvider(create: (_) => NotificationsRepo())
      ],
      child: MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EgenSolve',
          theme: ThemeData(
            useMaterial3: true,
          ),
          onGenerateRoute: AppPages.generateRouteSetting,
        ),
      ),
    );
  }
}
