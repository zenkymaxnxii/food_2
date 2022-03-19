class Users{
  int _id;
  String _name;
  String _email;
  String _phone;
  String _password;

  Users([this._id = 0,this._name = '', this._email = '', this._phone = '', this._password = '']);

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap(){
    return {
      'name': _name,
      'email': _email,
      'phone': _phone,
      'password': _password,
    };
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'User{id: $_id, name: $_name, email: $_email, phone: $_phone, password: $_password}';
  }

}