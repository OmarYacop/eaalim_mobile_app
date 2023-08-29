import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/data/fetched_user_data.dart';
import 'widgets/profile_widgets.dart';
import 'widgets/settings_widget.dart';
import '../login/login_screen.dart';
import '../../constants/widgets/avatar.dart';
import '../../constants/widgets/base_btn.dart';
import '../../constants/widgets/flutter_toast.dart';
import '../../controllers/them_bloc/theme_bloc.dart';
import '../../common/services/secure_storage.dart';
import '../../constants/core/theme/app_colors.dart';
import '../../controllers/app_entry_bloc/bottom_nav_bloc.dart';
import '../../controllers/app_entry_bloc/bottom_nav_event.dart';
import '../../controllers/app_entry_bloc/bottom_nav_state.dart';
import '../../global.dart';
import '../../controllers/login_bloc/user_bloc.dart';
import '../../controllers/login_bloc/user_event.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) =>
            LayoutBuilder(builder: (context, constraints) {
              double width = constraints.maxWidth;
              double height = constraints.maxHeight;

              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(height * 0.005),
                      child: const SizedBox(),
                    ),
                    expandedHeight: height * 0.3,
                    backgroundColor: AppColors.primary,
                    flexibleSpace: SafeArea(
                      child: FlexibleSpaceBar(
                        background: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.13),
                          child: Align(child: avatar(width * 0.11, 30)),
                        ),
                        titlePadding: EdgeInsets.only(bottom: height * 0.01),
                        title: buildProfileHeader(height, width),
                      ),
                    ),
                  ),
                  SliverList.list(children: [
                    profileDetails(width, height),
                    settings(context, width),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    BlocBuilder<NavBloc, NavState>(builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: width * 0.04,
                            left: width * 0.04,
                            bottom: height * 0.02),
                        child: ActionBTN(
                            function: () {
                              AwesomeDialog(
                                  context: context,
                                  width: width * 0.9,
                                  dialogType: DialogType.warning,
                                  title: 'Are You Sure ?',
                                  titleTextStyle: TextStyle(
                                      color: Global.darkMode!
                                          ? Colors.white
                                          : Colors.black),
                                  btnCancelOnPress: () {},
                                  dialogBackgroundColor: Global.darkMode!
                                      ? const Color.fromARGB(255, 33, 33, 33)
                                      : Colors.white,
                                  btnOkOnPress: () {
                                    toastInfo(msg: 'Logged Out');
                                    context
                                        .read<CredsBloc>()
                                        .add(const CredsEvent(false));
                                    UserData.removeData();
                                    UserSecureStorage.deleteVariable(
                                        'username');
                                    UserSecureStorage.deleteVariable(
                                        'password');
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LogInPage()));
                                    context
                                        .read<NavBloc>()
                                        .add(const NavEvent(index: 0));
                                  }).show();
                            },
                            prefixIcon: Icon(
                              Icons.logout,
                              color: AppColors.error,
                            ),
                            shadowless: true,
                            text: 'Log Out',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.error,
                            bg: Global.darkMode!
                                ? const Color.fromARGB(255, 33, 33, 33)
                                : const Color.fromARGB(255, 255, 255, 255),
                            iconPadding: width * 0.2,
                            width: width),
                      );
                    }),
                    SizedBox(
                      height: height * 0.1,
                    ),
                  ])
                ],
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
