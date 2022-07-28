import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_test/ui/chat/chat_controller.dart';
import 'package:provider/provider.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({Key? key}) : super(key: key);

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ChatController>(context);
    
    if(_scrollController.hasClients){
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 200,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: controller.messages.length,
        itemBuilder: (ctx, i) {
          return controller.messages[i];
        }
      ),
      // child: ListView(
      //   children: const [
      //     SizedBox(height: 10,),
      //     MessageWidget(received: true, text: "Hola"),
      //     MessageWidget(received: false, text: "HHolaHolaHolaHolaHolaHolaHolaHolaHolaHolaola"),
      //     MessageWidget(received: true, text: "todo fino?"),
      //     MessageWidget(received: false, text: "Si bro todo bien que haces?"),
      //     MessageWidget(received: true, text: "Nada aqui chateando y tu?"),
      //     MessageWidget(received: false, text: "Igual bro, esta bueno el chat xd"),
      //     MessageWidget(received: true, text: "Digalo xd"),
      //     MessageWidget(received: false, text: "Si bro"),
      //     MessageWidget(received: true, text: "que hacemos bro"),
      //     MessageWidget(received: false, text: "vamos a seguir programando"),
      //     MessageWidget(received: true, text: "Siva"),
      //     MessageWidget(received: false, text: "dale bro nos vemos chao"),
      //     MessageWidget(received: true, text: "chao"),
      //   ],
      // ),
    );
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}