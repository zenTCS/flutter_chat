import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_test/ui/home/home_controller.dart';
import 'package:flutter_chat_test/ui/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeButton extends StatefulWidget {
  HomeButton({Key? key}) : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (_) => setState(() {
              
            }),
            controller: _textEditingController,
          ),
          TextButton(
            onPressed: (_textEditingController.text.isNotEmpty) 
              ? () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('name', _textEditingController.text);
                  if(mounted){
                    Navigator.pushNamed(context, Routes.chat);
                  }
                } 
              : () => {},
            child: Text(
              "Conectar",
              style: TextStyle(
                color: (_textEditingController.text.isNotEmpty) ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}