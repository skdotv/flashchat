class RegistrationModel {
  String _username;
  String _password;
  RegistrationModel.zero();
  RegistrationModel(this._username, this._password);

  set username(String name) {
    this._username = name;
  }

  set password(String pass) {
    this._password = pass;
  }

  String get username => this._username;
  String get password => this._password;
}
