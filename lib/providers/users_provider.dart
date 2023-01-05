import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ucabgo_ui/classes/user.dart';

class Users with ChangeNotifier {
  final Set<User> _users = HashSet<User>();

  Set<User> get users => _users;

  void addUsers(List<User> value) {
    _users.addAll(value);
    notifyListeners();
  }
}
