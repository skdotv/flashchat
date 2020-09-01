import 'package:chat_system/common/common_widget.dart';
import 'package:chat_system/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationView extends StatefulWidget {
  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  RegistrationBloc _registrationBloc = RegistrationBloc();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                    height: 100,
                  ),
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 8.0),
                      child: StreamBuilder<String>(
                          stream: _registrationBloc.usernameStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                _registrationBloc.usernameSink.add(value);
                              },
                              validator: (value) =>
                                  value.isEmpty ? "Username Required" : null,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Username",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red[500],
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey[500],
                                    )),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red[500],
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey[500],
                                    )),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 8.0),
                      child: StreamBuilder<String>(
                          stream: _registrationBloc.passwordStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              obscureText: true,
                              onChanged: (value) =>
                                  _registrationBloc.passwordSink.add(value),
                              validator: (value) =>
                                  value.isEmpty ? "Password Required" : null,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red[500],
                                    )),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red[500],
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey[500],
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey[500],
                                    )),
                              ),
                            );
                          }),
                    ),
                    button(
                      label: "Register",
                      onPressed: _registerFuction,
                      color: Colors.blue[300],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _registerFuction() {
    if (_formkey.currentState.validate() == true) {
      final response = _registrationBloc.submitRegistration();
      if (response != null) {
        Navigator.pushNamed(context, '/chatview');
      }
    }
  }
}
