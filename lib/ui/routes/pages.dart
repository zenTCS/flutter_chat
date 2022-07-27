import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_test/ui/chat/chat_page.dart';
import 'package:flutter_chat_test/ui/home/home_page.dart';
import 'package:flutter_chat_test/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext context)> appRoutes() {
  return {
    Routes.home: (context) => const HomePage(),
    Routes.chat:(context) => const ChatPage(),
  };
}