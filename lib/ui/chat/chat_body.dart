import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_test/ui/chat/chat_controller.dart';
import 'package:flutter_chat_test/ui/chat/chat_messages.dart';
import 'package:flutter_chat_test/ui/chat/chat_send.dart';
import 'package:provider/provider.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ChatController>(context);
    return WillPopScope(
      onWillPop: () async {
        controller.desconectar();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text("Chat"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ChatMessages(),
            ChatSend(),
          ],
        ),
      ),
    );
  }
}