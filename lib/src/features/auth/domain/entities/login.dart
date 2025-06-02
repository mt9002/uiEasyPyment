class Credentials {
  String _email;
  String _password;

  Credentials(this._email, this._password);
  Credentials.empty()
      : _email = '',
        _password = '';

  String get email => _email;
  String get password => _password;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }
}


// class Credentials {
//   final String email;
//   final String password;

//   const Credentials({required this.email, required this.password});

//   Credentials copyWith({String? email, String? password}) {
//     return Credentials(
//       email: email ?? this.email,
//       password: password ?? this.password,
//     );
//   }
// }