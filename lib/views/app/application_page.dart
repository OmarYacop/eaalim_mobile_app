import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/core/theme/app_colors.dart';

import '../../constants/widgets/bottom_nav_bar_manager.dart';
import 'widgets/bottom_nav_bar.dart';
import '../../controllers/app_entry_bloc/bottom_nav_bloc.dart';
import '../../controllers/app_entry_bloc/bottom_nav_event.dart';
import '../../controllers/app_entry_bloc/bottom_nav_state.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return BlocBuilder<NavBloc, NavState>(builder: (context, navState) {
      return Scaffold(
          backgroundColor: AppColors.primary,
          resizeToAvoidBottomInset: false,
          body: PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (value) => value != navState.index
                ? context.read<NavBloc>().add(NavEvent(index: value))
                : null,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BottomNavBarWidget(
            navState: navState,
            pageController: pageController,
          ));
    });
  }
}
