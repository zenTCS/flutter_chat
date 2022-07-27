import 'package:flutter/material.dart';
import 'package:flutter_chat_test/ui/chat/chat_controller.dart';
import 'package:provider/provider.dart';

class ChatSend extends StatelessWidget {
  ChatSend({Key? key}) : super(key: key);
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ChatController>(context);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(0, 82, 82, 83)
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )
            ),
          )),
          IconButton(
            onPressed: () {
              controller.sendMessage(_textController.text);
              controller.addMessage(_textController.text, false);
              _textController.text = "";
            },
            icon: const Icon(Icons.send, size: 30, color: Colors.blue,),
          ),
        ],
      ),
    );
  }
}