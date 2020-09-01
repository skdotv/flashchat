import 'dart:async';

import 'package:chat_system/registration/model/registration_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationBloc {
  final _auth = FirebaseAuth.instance;
  RegistrationModel _registrationModel = RegistrationModel.zero();

  RegistrationBloc() {
    this.usernameController.listen(usernameListener);
    this.passwordController.listen(passswordListener);
  }
  final usernameController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();

  Stream<String> get usernameStream =>
      usernameController.stream.asBroadcastStream();
  Stream<String> get passwordStream =>
      passwordController.stream.asBroadcastStream();

  StreamSink<String> get usernameSink => usernameController.sink;
  StreamSink<String> get passwordSink => passwordController.sink;

  void usernameListener(String value) {
    _registrationModel.username = value;
  }

  void passswordListener(String value) {
    _registrationModel.password = value;
  }

  Stream<bool> get registerValid {
    return Rx.combineLatest(
        [usernameStream, passwordStream], ([stramList]) => true);
  }

  submitRegistration() async {
    try {
      final _newUser = await _auth.createUserWithEmailAndPassword(
          email: _registrationModel.username,
          password: _registrationModel.password);
      return _newUser;
    } catch (e) {
      print(e);
    }
  }

  void register() {}

  void dispose() {
    usernameController.close();
    passwordController.close();
  }
}
