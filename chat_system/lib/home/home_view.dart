import 'package:chat_system/common/common_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Hero(
            tag: "logotag",
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/logo/energy.png",
                height: 50,
              ),
            ),
          ),
          Text(
            "Flash Chat",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[500]),
          ),
          button(
            color: Colors.green[400],
            onPressed: _loginFunction,
            label: "Log In",
          ),
          button(
            label: "Register",
            color: Colors.blue[300],
            onPressed: _registerFunction,
          )
        ],
      )),
    );
  }

  void _loginFunction() {
    Navigator.pushNamed(context, '/login');
  }

  void _registerFunction() {
    Navigator.pushNamed(context, '/register');
  }
}
