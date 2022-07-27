import 'package:flutter/material.dart';
import 'package:flutter_chat_test/ui/home/home_page.dart';
import 'package:flutter_chat_test/ui/routes/pages.dart';
import 'package:flutter_chat_test/ui/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes(),
      initialRoute: Routes.home,
    );
  }
}