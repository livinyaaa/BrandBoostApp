import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class UserService {
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/users.json');
  }

  Future<Map<String, dynamic>> readUsers() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return json.decode(contents);
    } catch (e) {
      return {};
    }
  }

  Future<File> writeUser(String email, String password) async {
    final file = await _localFile;
    Map<String, dynamic> data = await readUsers();
    data[email] = password;
    return file.writeAsString(json.encode(data));
  }

  Future<bool> validateUser(String email, String password) async {
    Map<String, dynamic> data = await readUsers();
    return data[email] == password;
  }


}