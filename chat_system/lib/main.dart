import 'package:chat_system/common/constants.dart';
import 'package:chat_system/home/home_view.dart';
import 'package:chat_system/login/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeView(),
      initialRoute: '/',
      routes: routes(context),
    );
  }
}
