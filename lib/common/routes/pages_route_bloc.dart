import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repository/repos.dart';
import '../../controllers/app_entry_bloc/bottom_nav_bloc.dart';
import '../../controllers/auth_bloc/auth_bloc.dart';
import '../../controllers/chat_bloc/chat_bloc.dart';
import '../../controllers/guest_cubit/guest_cubit.dart';
import '../../controllers/home_bloc/home_bloc.dart';
import '../../controllers/login_bloc/user_bloc.dart';
import '../../controllers/notifications_bloc/notifications_bloc.dart';
import '../../controllers/notifications_cubit/notifications_cubit.dart';
import '../../controllers/schedule_bloc/days_of_week_bloc.dart';
import '../../controllers/session_actions_bloc/bloc/session_actions_bloc.dart';
import '../../controllers/session_cubit/session_cubit.dart';
import '../../controllers/them_bloc/theme_bloc.dart';
import '../../controllers/welcome_bloc/welcome_bloc.dart';
import '../../global.dart';
import '../../views/app/application_page.dart';
import '../../views/chat/chat_main_page.dart';
import '../../views/home/home_page.dart';
import '../../views/login/login_screen.dart';
import '../../views/login/widgets/credentials_widget.dart';
import '../../views/notifications/notification_page.dart';
import '../../views/schedule/schedule_screen.dart';
import '../../views/splash/splash_screen.dart';
import '../../views/welcome/welcome_page.dart';
import 'route_names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.WELCOME,
        page: const WelcomePage(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const LogInScreenWidget(),
        bloc: BlocProvider(create: (_) => AuthBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const LogInPage(),
        bloc: BlocProvider(
            create: (context) => GuestCubit(
                  authBloc: context.read<AuthBloc>(),
                  authRepository: context.read<AuthRepository>(),
                )),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
            create: (context) => SessionCubit(
                sessionsRepository: context.read<SessionsRepository>())),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (context) => AbsentBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const LogInPage(),
        bloc: BlocProvider(
          create: (_) => CredsBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const LogInPage(),
        bloc: BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const LogInPage(),
        bloc: BlocProvider(
          create: (_) => TeacherStudentBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => NavBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => EndBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => CancelBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => ThemeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SCHEDULE,
        page: const SchedulePage(),
        bloc: BlocProvider(
          create: (_) => DaysBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SCHEDULE,
        page: const SchedulePage(),
        bloc: BlocProvider(
          create: (_) => LoadBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.CHAT,
        page: const ChatMainPage(),
        bloc: BlocProvider(
          create: (_) => ChatBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const LogInScreenWidget(),
        bloc: BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.NOTIFICATIONS,
        page: const NotificationPage(),
        bloc: BlocProvider(
            create: (context) => NotificationsCubit(
                notificationsRepo: context.read<NotificationsRepo>())),
      ),
      PageEntity(
        route: AppRoutes.NOTIFICATIONS,
        page: const NotificationPage(),
        bloc: BlocProvider(create: (context) => NotificationsCounterBloc()),
      ),
      PageEntity(
        route: AppRoutes.NOTIFICATIONS,
        page: const NotificationPage(),
        bloc: BlocProvider(create: (context) => NotificationsBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (context) => SendBloc()),
      ),
    ];
  }

// return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

// a model that cover screen
  static MaterialPageRoute generateRouteSetting(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name when navigator get trigger
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstopen = Global.isFirstTime!;
        if (deviceFirstopen) {
          return MaterialPageRoute(
              builder: (_) => const WelcomePage(), settings: settings);
        } else if (!deviceFirstopen) {
          return MaterialPageRoute(
              builder: (_) => const SplashScreen(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const LogInPage(), settings: settings);
  }
}

// unify bloc provider and routs and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
