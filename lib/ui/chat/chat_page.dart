import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_test/ui/chat/chat_body.dart';
import 'package:flutter_chat_test/ui/chat/chat_controller.dart';
import 'package:flutter_chat_test/ui/home/home_controller.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final controller = ChatController(context);
        controller.conectar();
        return controller;
      },
      child: const ChatBody(),
    );
  }
}