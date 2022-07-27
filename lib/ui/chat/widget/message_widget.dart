import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key, required this.received, required this.text, }) : super(key: key);
  final bool received;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (received) ? Colors.white : Colors.blue,
        borderRadius: const BorderRadius.all(
          Radius.circular(20)
        ),
      ),
      padding: const EdgeInsets.all(10),
      margin: (received) 
        ? const EdgeInsets.only(
            right: 40,
            bottom: 10,
            left: 5
          ) 
        : const EdgeInsets.only(
            left: 40,
            bottom: 10,
            right: 5
          ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}