import 'dart:ui';

import 'package:Eaalim/constants/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../api/models/chat_model/chat.dart';
import '../../../common/services/similarity.dart';
import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/core/theme/images.dart';
import '../../../constants/widgets/base_text_widget.dart';
import '../../../constants/widgets/beauty_container.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../controllers/chat_bloc/chat_bloc.dart';
import '../../../controllers/chat_bloc/chat_event.dart';
import '../../../controllers/chat_bloc/chat_state.dart';
import '../../../global.dart';
import '../../../resources/chats.dart';
import 'chat_page.dart';

Widget buildAppBarWidgetOfChat(BuildContext context, double width,
    double height, TextEditingController searchController) {
  return BlocBuilder<ChatBloc, ChatState>(
    builder: (context, state) {
      return Padding(
          padding: EdgeInsets.only(
              left: width * 0.02,
              right: width * 0.001,
              top: height * 0.08,
              bottom: state.isSearching ? height * 0.028 : height * 0.031),
          child: state.isSearching
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    inputField(
                        Icons.search, width * 0.85, null, searchController,
                        bg: Global.darkMode!
                            ? const Color.fromARGB(255, 33, 33, 33)
                            : const Color.fromARGB(255, 255, 255, 255),
                        hint: 'Search',
                        autoFocus: true,
                        hintColor: Global.darkMode!
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 33, 33, 33),
                        onChanged: () {
                      context
                          .read<ChatBloc>()
                          .add(UpdateSearchEvent(searchController.text));
                    }),
                    IconButton(
                      onPressed: () {
                        searchController.clear();
                        context
                            .read<ChatBloc>()
                            .add(UpdateSearchEvent(searchController.text));
                        context.read<ChatBloc>().add(const SearchEvent(false));
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textBox(null, null, '${AppString.titleHomePage} Chat',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    IconButton(
                        onPressed: () {
                          context.read<ChatBloc>().add(const SearchEvent(true));
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
                ));
    },
  );
}

//////////////////////////////////////////////////////////

DateTime now = DateTime.now();
DateFormat dateFormat = DateFormat('yyyy-MM-dd');
String formattedDate = dateFormat.format(now);

Widget chatMSG(BuildContext context, bool isLast, double height, double width,
    String chatName, String lastMSG, String lastMSGDate, String profile) {
  return Padding(
    padding: EdgeInsets.only(bottom: isLast ? height * 0.1 : height * 0.02),
    child: TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatPage(
                      chatName: chatName,
                    )));
      },
      onLongPress: () {},
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(AppColors.secondary)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImages.avatar2), //profile
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Global.darkMode! ? Colors.white : Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        size: 15,
                        color: Global.darkMode! ? Colors.white : Colors.black,
                      ),
                      Text(
                        lastMSG,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Text(
            lastMSGDate,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Global.darkMode! ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
///////////////////////////////////////////////////////////////////

Widget buildBodyOfChat(double height, double width) {
  return Expanded(
    child: Stack(children: [
      beautyContainer(
        null,
        width: width,
        allCircular: false,
        topLeft: 15,
        topRight: 15,
        shadowless: true,
        backgroundColor: Global.darkMode!
            ? const Color.fromARGB(255, 33, 33, 33)
            : const Color.fromARGB(255, 255, 255, 255),
        child: GestureDetector(
          onVerticalDragDown: (details) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return state.searchText == ''
                  ? ListView.builder(
                      itemCount: chats.length,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.03,
                              right: width * 0.03,
                            ),
                            child: chatMSG(
                                context,
                                index == chats.length - 1,
                                height,
                                width,
                                chats[index].chatName,
                                chats[index].lastMSG,
                                chats[index].lastMSGDate,
                                chats[index].profile),
                          ))
                  : getSearchResults(state, width, height);
            },
          ),
        ),
      ),
      beautyContainer(
        null,
        width: width,
        allCircular: false,
        topLeft: 15,
        topRight: 15,
        shadowless: true,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.headphones,
                    size: 100,
                    color: Global.darkMode! ? Colors.white : Colors.grey[850],
                  ),
                  textBox(null, null, 'Coming Soon',
                      color: Global.darkMode! ? Colors.white : Colors.grey[850],
                      alignment: Alignment.center,
                      maxLines: 10,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                  Text(
                    'Stay tuned for a more engaging and seamless chatting experience.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Global.darkMode! ? Colors.white : Colors.grey[850],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ),
      )
    ]),
  );
}

/////////   Get Search Results

Widget getSearchResults(ChatState state, double width, double height) {
  List<ChatEntity> results = search(state);

  if (results.isEmpty) {
    return Center(
      child: Text(
        'No results found',
        style: TextStyle(color: Global.darkMode! ? Colors.white : Colors.black),
      ),
    );
  } else {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: width * 0.03,
              right: width * 0.03,
            ),
            child: chatMSG(
                context,
                index == results.length - 1,
                height,
                width,
                results[index].chatName,
                results[index].lastMSG,
                results[index].lastMSGDate,
                results[index].profile),
          );
        });
  }
}

List<ChatEntity> search(ChatState state) {
  List<ChatEntity> contactResults = [];
  String query = state.searchText;
  Map<ChatEntity, double> entities = {};

  for (int index = 0; index < chats.length; index++) {
    ChatEntity element = chats[index];
    List<String> nameParts = element.chatName.split(' ');
    if (query.length == 1) {
      element.chatName.toLowerCase().contains(query.toLowerCase())
          ? contactResults.add(element)
          : null;
    } else {
      for (String namePart in nameParts) {
        double similarityResult = jaroWinklerSimilarity(namePart, query);
        if (similarityResult > 0.78) {
          entities[element] =
              similarityResult; // Adding to the contactResults map
          break;
        }
      }
    }
  }
  var sortedKeys = entities.keys.toList(growable: false)
    ..sort((key1, key2) => entities[key2]!.compareTo(entities[key1]!));
  for (var key in sortedKeys) {
    contactResults.add(key);
  }
  return contactResults;
}
