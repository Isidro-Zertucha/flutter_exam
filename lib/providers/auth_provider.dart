
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  static const String _usersKey = 'users';
  static const String _lastUserKey = 'last_logged_in_user';

  Future<List<UserModel>> _getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString(_usersKey);
    if (usersJson == null) {
      return [];
    }
    final usersList = jsonDecode(usersJson) as List;
    return usersList.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<void> _saveUsers(List<UserModel> users) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = jsonEncode(users.map((user) => user.toJson()).toList());
    await prefs.setString(_usersKey, usersJson);
  }

  Future<bool> signUp(String username, String email, String password) async {
    final users = await _getUsers();
    if (users.any((user) => user.username == username)) {
      return false; // Username already exists
    }

    final newUser = UserModel(username: username, email: email, password: password);
    users.add(newUser);
    await _saveUsers(users);

    _user = newUser;
    await _saveLastLoggedInUser(username);
    notifyListeners();
    return true;
  }

  Future<bool> login(String username, String password) async {
    final users = await _getUsers();
    try {
      final user = users.firstWhere(
        (user) => user.username == username && user.password == password,
      );
      _user = user;
      await _saveLastLoggedInUser(username);
      notifyListeners();
      return true;
    } catch (e) {
      return false; // User not found
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lastUserKey); // Clear last logged in user
    _user = null;
    notifyListeners();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final lastUsername = prefs.getString(_lastUserKey);
    if (lastUsername != null) {
      final users = await _getUsers();
      try {
        _user = users.firstWhere((user) => user.username == lastUsername);
        notifyListeners();
      } catch (e) {
        // User might have been deleted, do nothing
      }
    }
  }

  Future<void> _saveLastLoggedInUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastUserKey, username);
  }
}

