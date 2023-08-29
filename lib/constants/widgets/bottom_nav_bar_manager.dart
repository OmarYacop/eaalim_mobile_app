import 'package:flutter/material.dart';

import '../../views/profile/profile_screen.dart';
import '../../views/chat/chat_main_page.dart';
import '../../views/home/home_page.dart';
import '../../views/schedule/schedule_screen.dart';

List<Widget> pages = [
  const HomePage(),
  const ChatMainPage(),
  const SchedulePage(),
  const ProfilePage(),
];
