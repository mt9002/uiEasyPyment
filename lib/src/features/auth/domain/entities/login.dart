class Credentials {
  String _email;
  String _password;

  Credentials(this._email, this._password);
  
  Credentials.empty()
      : _email = '',
        _password = '';

  String get getEmail => _email;
  String get getPassword => _password;
  void setEmail(String email) {_email = email;}
  void setPassword(String password) {_password = password;}

}