import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_test/ui/home/home_controller.dart';
import 'package:flutter_chat_test/ui/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  final TextEditingController _textEditingController = TextEditingController();

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 25, left: 25),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'John',
                labelText: 'Nombre'
              ),
              onChanged: (_) => setState(() {
                
              }),
              controller: _textEditingController,
            ),
          ),
          Column(
            children: [
              RadioListTile(
                title: const Text("Admin"),
                value: 0,
                groupValue: _selectedIndex,
                onChanged: (int? newIndex) {
                  setState(() {
                    _selectedIndex = newIndex;
                  });
                }
              ),
              RadioListTile(
                title: const Text("User"),
                value: 1,
                groupValue: _selectedIndex,
                onChanged: (int? newIndex) {
                  setState(() {
                    _selectedIndex = newIndex;
                  });
                }
              ),
            ],
          ),
          TextButton(
            onPressed: (_textEditingController.text.isNotEmpty && _selectedIndex != null) 
              ? () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('name', _textEditingController.text);
                  prefs.setString('type', (_selectedIndex == 0) ? 'Admin' : 'User');
                  if(mounted){
                    Navigator.pushNamed(context, Routes.chat);
                  }
                } 
              : () => {},
            child: Text(
              "Conectar",
              style: TextStyle(
                color: (_textEditingController.text.isNotEmpty && _selectedIndex != null) ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}