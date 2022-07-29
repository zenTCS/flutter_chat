import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_test/ui/chat/widget/message_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatController extends ChangeNotifier{
  ChatController(this.context);
  final BuildContext context;
  Socket? client;
  List<Widget> messages = [
    const SizedBox(height: 10,),
  ];
  void conectar() async {{
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final clientio = io(
      'http://172.16.90.127:3000/chat?name=$name', 
      <String, dynamic> {'transports': ['websocket']
    });
    client = clientio;
    clientio.onDisconnect((data) {
      log("desconectado $data");
      desconectar();
      Navigator.pop(context);
    });
    clientio.on('message', (data) {
      addMessage(data, true);
    });
  }}

  void sendMessage(String text){
    client?.emit('message', text);
  }

  void addMessage(String text, bool received){
    if(received){
      final splittedText = text.split(' ');
      final name = splittedText[0];
      splittedText.remove(name);
      final data = splittedText.join(' ');
      messages.add(MessageWidget(received: received, text: data, name: name));
    } else {
      messages.add(MessageWidget(received: received, text: text));
    }
    notifyListeners();
  }

  void desconectar(){
    client?.disconnect();
    client = null;
  }
}