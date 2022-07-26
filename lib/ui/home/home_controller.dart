import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';

class HomeController extends ChangeNotifier{
  Socket? client;

  void conectar(){{
    final clientio = io(
      'http://172.16.90.127:3000/chat', 
      <String, dynamic> {'transports': ['websocket']
    });
    client = clientio;
    clientio.onConnect((data) => log("Hola"));
    clientio.onDisconnect((data) => log("desconectado"));
  }}

  void desconectar(){
    client?.disconnect();
    client = null;
  }
}