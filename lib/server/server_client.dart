import 'dart:convert';
import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart';

void main(List<String> args) {
  final client = io(
    'http://172.16.90.127:3000/chat', 
    <String, dynamic> {'transports': ['websocket']
  });

  client.onConnect((data) {
    print('Conectado');
    client.emit('name', args[0]);
    readLine().listen((String event) {
      client.emit('msg', event);
    });
  });

  client.on('msg', (data) => print(data));
  // client.on('msg1', (data) => print(data));

  // client.emit('msg', 'hola mundo');

  client.onDisconnect((data) => print('Desconectado'));

  // client.onConnecting((data) => print('Hola'));
}

Stream<String> readLine() => stdin.transform(utf8.decoder).transform(const LineSplitter());