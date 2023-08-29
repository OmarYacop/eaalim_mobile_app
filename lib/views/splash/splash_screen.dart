import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/data/fetched_user_data.dart';
import '../../controllers/guest_cubit/guest_cubit.dart';
import '../../constants/core/theme/app_colors.dart';
import '../../constants/core/theme/images.dart';
import '../../controllers/notifications_cubit/notifications_cubit.dart';
import '../../global.dart';
import '../app/application_page.dart';
import 'widgets/splash_animation.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  Timer? _resetTimer;

  double _opacity = 0;
  bool _value = true;

  @override
  void initState() {
    super.initState();

    SystemChannels.textInput.invokeMethod('TextInput.hide');

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addStatusListener(
        (status) async {
          if (status == AnimationStatus.completed) {
            bool loggedIn = await silentLogin();
            if (loggedIn) {
              await getNotificationsNumber();
              Future.delayed(
                  Duration.zero,
                  () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ApplicationPage())));
            } else {
              if (mounted) {
                Navigator.of(context).pushReplacement(
                  ThisIsFadeRoute(
                    route: const LogInPage(),
                    page: const LogInPage(),
                  ),
                );
              }
            }

            _resetTimer = Timer(
              const Duration(milliseconds: 200),
              () {
                if (mounted) {
                  scaleController.reset();
                }
              },
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        _value = false;
      });
    });
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    _resetTimer?.cancel(); // Cancel the timer if it's active
    scaleController.dispose();
    super.dispose();
  }

  Future<bool> silentLogin() async {
    if (Global.username != null &&
        Global.password != null &&
        Global.lastSignInType != null) {
      await context.read<GuestCubit>().signIn(
            context,
            Global.username!,
            Global.password!,
            Global.lastSignInType! == 'Teacher',
          );
    }
    return UserData.accessToken != null;
  }

  Future<void> getNotificationsNumber() async {
    List data = await Future.delayed(Duration.zero, () async {
      return await context.read<NotificationsCubit>().getNotifications(context);
    });
    if (data.isNotEmpty) {
      Global.unreadNotifications =
          data.where((element) => element.first['seen'] == 0).length;
      for (var notification in data) {
        if (notification.first['seen'] == '0') {
          Global.unreadNotifications = Global.unreadNotifications + 1;
        }
      }
    } else {
      Global.unreadNotifications = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;

      return Scaffold(
        backgroundColor: Global.darkMode! ? Colors.grey[850] : Colors.white,
        body: Stack(
          children: [
            Center(
              child: AnimatedOpacity(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 1),
                opacity: _opacity,
                child: AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 1),
                  height: _value ? height * 15 / 72 : height / 3,
                  width: _value ? width / 7 : width * 3 / 4,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(.2),
                        blurRadius: width * 0.3,
                        spreadRadius: width * 0.1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Stack(children: [
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: width / 4,
                          height: height / 7.2,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: AnimatedBuilder(
                            animation: scaleAnimation,
                            builder: (c, child) => Transform.scale(
                              scale: scaleAnimation.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image(
                          fit: BoxFit.scaleDown,
                          width: width * 0.45,
                          height: height * 0.2,
                          image: const AssetImage(AppImages.logo),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
