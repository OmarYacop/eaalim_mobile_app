import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/beauty_container.dart';
import '../../../controllers/app_entry_bloc/bottom_nav_bloc.dart';
import '../../../controllers/app_entry_bloc/bottom_nav_event.dart';
import '../../../controllers/app_entry_bloc/bottom_nav_state.dart';
import '../../../controllers/chat_bloc/chat_bloc.dart';
import '../../../controllers/chat_bloc/chat_event.dart';
import '../../../controllers/them_bloc/theme_bloc.dart';
import '../../../global.dart';

class BottomNavBarWidget extends StatelessWidget {
  final NavState navState;
  final PageController pageController;
  const BottomNavBarWidget({
    Key? key,
    required this.navState,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double height = constraints.maxHeight;
      double width = constraints.maxWidth;
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => beautyContainer(
          height * 0.07,
          width: width * 0.85,
          allCircular: false,
          topLeft: 50,
          topRight: 50,
          bottomLeft: 50,
          bottomRight: 50,
          shadowless: true,
          backgroundColor: Global.darkMode!
              ? const Color.fromARGB(255, 55, 55, 55)
              : const Color.fromARGB(255, 238, 238, 238),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bottomNavBarBTN(
                  context,
                  width,
                  height,
                  navState,
                  Colors.grey.withAlpha(150),
                  0,
                  [
                    Icons.home,
                    Icons.home_outlined,
                  ],
                  'Home',
                  Colors.grey,
                  iconImageDistance: 11),
              bottomNavBarBTN(
                  context,
                  width,
                  height,
                  navState,
                  Colors.grey.withAlpha(150),
                  1,
                  [
                    Icons.chat,
                    Icons.chat_outlined,
                  ],
                  'Chat',
                  AppColors.green.withAlpha(150),
                  iconImageDistance: 15),
              bottomNavBarBTN(
                  context,
                  width,
                  height,
                  navState,
                  Colors.grey.withAlpha(150),
                  2,
                  [
                    Icons.timelapse,
                    Icons.timelapse_outlined,
                  ],
                  'Schedule',
                  const Color(0xff4E598C),
                  iconImageDistance: 4),
              bottomNavBarBTN(
                context,
                width,
                height,
                navState,
                Colors.grey.withAlpha(150),
                3,
                [
                  Icons.person,
                  Icons.person,
                ],
                'Profile',
                Colors.grey.withAlpha(150),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget bottomNavBarBTN(
      BuildContext context,
      double width,
      double height,
      NavState state,
      Color btnBg,
      int triggerIndex,
      var icons,
      String title,
      Color overlayColor,
      {double iconImageDistance = 5}) {
    return Container(
      height: height * 0.06,
      width: state.index == triggerIndex ? width * 0.3 : width * 0.165,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(overlayColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              )),
              backgroundColor: MaterialStateProperty.all(
                  state.index == triggerIndex ? btnBg : Colors.transparent)),
          onPressed: () {
            context.read<ChatBloc>().add(const SearchEvent(false));
            context.read<ChatBloc>().add(const UpdateSearchEvent(''));
            pageController.jumpToPage(
              triggerIndex,
            );
            triggerIndex != state.index
                ? context.read<NavBloc>().add(NavEvent(index: triggerIndex))
                : null;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: state.index == triggerIndex
                ? [
                    Icon(
                      icons[0],
                      color: !Global.darkMode! ? Colors.black : Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: iconImageDistance,
                    ),
                    Text(title,
                        style: TextStyle(
                            fontSize: 13,
                            color:
                                !Global.darkMode! ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold))
                  ]
                : [
                    Icon(
                      icons[1],
                      color: !Global.darkMode! ? Colors.black : Colors.white,
                      size: 25,
                    ),
                  ],
          )),
    );
  }
}
