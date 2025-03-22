import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool login(String username, String password) {
    if (username == "admin" && password == "admin@123") {
      return true;
    }
    return false;
  }
}
