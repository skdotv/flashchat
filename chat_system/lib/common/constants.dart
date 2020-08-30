import 'package:chat_system/chatview/chat_view.dart';
import 'package:chat_system/home/home_view.dart';
import 'package:chat_system/login/login_view.dart';
import 'package:chat_system/registration/registration_view.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes(BuildContext context) {
  final Map<String, Widget Function(BuildContext)> map = {
    '/': (context) => LoginView(),
    '/home': (context) => HomeView(),
    'registration': (context) => RegistrationView(),
    'chatview': (context) => ChatView(),
  };
  return map;
}
