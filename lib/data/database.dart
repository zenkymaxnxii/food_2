import 'package:food/models/users_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUser {
  Future<void> init() async {
    var sql = 'CREATE TABLE IF NOT EXISTS Users('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' name TEXT,'
        ' email TEXT UNIQUE,'
        ' phone TEXT UNIQUE,'
        ' password TEXT'
        ')';

    var db = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (database, version) {
        return database.execute(sql);
      },
      version: 1,
    );
  }

  Future<int> insertUsers(Users users) async {
    var db = await openDatabase('user_database.db');
    return await db.insert('Users', users.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<Users> getUsers(String phone) async {
    var db = await openDatabase('user_database.db');
    List<Map<String, dynamic>> listUsers =
        await db.query('Users', where: 'phone = ?', whereArgs: [phone]);
    Users users = Users();
    List.generate(listUsers.length, (index) {
      users.id = listUsers[index]['id'];
      users.name = listUsers[index]['name'];
      users.email = listUsers[index]['email'];
      users.phone = listUsers[index]['phone'];
      users.password = listUsers[index]['password'];
    });
    return users;
  }

  Future<Users> login(String phone, String password) async {
    var db = await openDatabase('user_database.db');
    List<Map<String, dynamic>> listUsers =
    await db.query('Users', where: 'phone = ?', whereArgs: [phone]);
    Users users = Users();
    List.generate(listUsers.length, (index) {
      users.id = listUsers[index]['id'];
      users.name = listUsers[index]['name'];
      users.email = listUsers[index]['email'];
      users.phone = listUsers[index]['phone'];
      users.password = listUsers[index]['password'];
    });
    return users.password==password?users:Users();
  }

  Future<int> deleteUsers([String phone = ''])async {
    var db = await openDatabase('user_database.db');
    int check = 0;
    if(phone!=''){
      check = await db.delete('Users',where: 'phone = ?', whereArgs: [phone]);
    } else {
      check = await db.delete('Users');
    }
    return check;
  }

  Future<void> dispose() async {
    var db = await openDatabase('user_database.db');
    db.close();
    await deleteDatabase(await getDatabasesPath());
  }
}
