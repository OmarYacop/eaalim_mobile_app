import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/core/theme/app_colors.dart';
import '../../controllers/welcome_bloc/welcome_bloc.dart';
import '../login/login_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;

      return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return state.index != 2
                ? Padding(
                    padding: EdgeInsets.only(bottom: height * 0.06),
                    child: SizedBox(
                      width: width * 0.25,
                      child: BlocBuilder<WelcomeBloc, WelcomeState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              state.index == 0
                                  ? _selectedAvatar(width)
                                  : _stationaryAvatar(context, width,
                                      state.index, 0, controller),
                              state.index == 1
                                  ? _selectedAvatar(width)
                                  : _stationaryAvatar(context, width,
                                      state.index, 1, controller),
                              state.index == 2
                                  ? _selectedAvatar(width)
                                  : _stationaryAvatar(context, width,
                                      state.index, 2, controller),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(bottom: height * 0.03),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(AppColors.primary)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogInPage()));
                        },
                        child: const Text('Get Started')));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SizedBox(
          height: height,
          width: width,
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              context.read<WelcomeBloc>().add(SwipeEvent(index: value));
            },
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: width * 0.1,
                    left: width * 0.1,
                    top: height * 0.1,
                    bottom: height * 0.2),
                child: Container(
                  height: height * 0.7,
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Image.asset('assets/images/onboarding1.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: width * 0.1,
                    left: width * 0.1,
                    top: height * 0.1,
                    bottom: height * 0.2),
                child: Container(
                  height: height * 0.7,
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Image.asset('assets/images/onboarding2.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: width * 0.1,
                    left: width * 0.1,
                    top: height * 0.1,
                    bottom: height * 0.2),
                child: Container(
                  height: height * 0.7,
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Image.asset('assets/images/onboarding3.jpg'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _stationaryAvatar(BuildContext context, double width, int index,
      int itemIndex, PageController controller) {
    return GestureDetector(
      onTap: () {
        context.read<WelcomeBloc>().add(SwipeEvent(index: itemIndex));
        controller.animateToPage(itemIndex,
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      },
      child: CircleAvatar(
        radius: width * 0.013,
        backgroundColor: Colors.grey[400],
      ),
    );
  }

  Widget _selectedAvatar(double width) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      width: width * 0.056,
      height: width * 0.026,
    );
  }
}
