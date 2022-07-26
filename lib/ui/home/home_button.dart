import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_test/ui/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return TextButton(
      onPressed: controller.conectar,
      child: const Text("Conectar"),
    );
  }
}