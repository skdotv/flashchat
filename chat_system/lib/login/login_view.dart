import 'package:chat_system/common/common_widget.dart';
import 'package:chat_system/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginBloc _loginBloc = LoginBloc();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Center(
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
                            stream: _loginBloc.usernameStream,
                            builder: (context, snapshot) {
                              return TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  _loginBloc.usernameSink.add(value);
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
                            stream: _loginBloc.passwordStream,
                            builder: (context, snapshot) {
                              return TextFormField(
                                obscureText: true,
                                onChanged: (value) =>
                                    _loginBloc.passwordSink.add(value),
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
                        label: "Log In",
                        onPressed: _loginFuction,
                        color: Colors.blue[300],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _loginFuction() async {
    if (_formkey.currentState.validate() == true) {
      setState(() {
        _showSpinner = true;
      });
      final response = await _loginBloc.submitLogin();
      if (response.user.email != null) {
        setState(() {
          _showSpinner = false;
        });
        Navigator.pushNamedAndRemoveUntil(
            context, '/chatview', (route) => false);
      }
    }
  }
}
