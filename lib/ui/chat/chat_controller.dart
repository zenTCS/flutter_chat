import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_test/ui/chat/widget/message_widget.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatController extends ChangeNotifier{
  ChatController(this.context);
  final BuildContext context;
  Socket? client;
  List<Widget> messages = [
    const SizedBox(height: 10,),
    const MessageWidget(received: true, text: "a")
  ];
  void conectar(){{
    final clientio = io(
      'http://172.16.90.127:3000/chat', 
      <String, dynamic> {'transports': ['websocket']
    });
    client = clientio;
    clientio.onConnect((data) => log("Hola"));
    clientio.onDisconnect((data) {
      log("desconectado $data");
      desconectar();
      Navigator.pop(context);
    });
    clientio.on('msg', (data) {
      addMessage(data, true);
    });
  }}

  void sendMessage(String text){
    client?.emit('msg', text);
  }

  void addMessage(String text, bool received){
    messages.add(MessageWidget(received: received, text: text));
    notifyListeners();
  }

  void desconectar(){
    client?.disconnect();
    client = null;
  }
}