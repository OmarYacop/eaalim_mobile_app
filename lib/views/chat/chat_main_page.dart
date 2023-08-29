import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/them_bloc/theme_bloc.dart';
import '../../controllers/chat_bloc/chat_bloc.dart';
import '../../controllers/chat_bloc/chat_state.dart';
import 'widgets/chat_widget.dart';

class ChatMainPage extends StatefulWidget {
  const ChatMainPage({super.key});

  @override
  State<ChatMainPage> createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    TextEditingController searchController = TextEditingController();
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return LayoutBuilder(builder: (context, constraints) {
              double width = constraints.maxWidth;
              double height = constraints.maxHeight;
              return Column(
                children: [
                  buildAppBarWidgetOfChat(
                      context, width, height, searchController),
                  buildBodyOfChat(height, width),
                ],
              );
            });
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
