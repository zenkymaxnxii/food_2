import 'package:food/models/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreference{
  late SharedPreferences _sharedPreferences;
  Future<String?> getPhone() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String? phone = _sharedPreferences.getString('phone');
    return phone;
  }
  Future<void> save(Users user) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setInt('id', user.id);
    await _sharedPreferences.setString('name', user.name);
    await _sharedPreferences.setString('email', user.email);
    await _sharedPreferences.setString('phone', user.phone);
    await _sharedPreferences.setString('password', user.password);
    print('Login success');
  }

  Future<Users> load() async {
    Users users = Users();
    int? id;
    String? name, email, phone;
    _sharedPreferences = await SharedPreferences.getInstance();
    id = _sharedPreferences.getInt('id');
    name = _sharedPreferences.getString('name');
    email = _sharedPreferences.getString('email');
    phone =  _sharedPreferences.getString('phone');
    users.id = id!;
    users.name = name!;
    users.email = email!;
    users.phone = phone!;
    print('Load user success');
    return users;
  }

  Future<void> logout()async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.remove('phone');
    await _sharedPreferences.remove('password');
    print('Logout success');
  }

}