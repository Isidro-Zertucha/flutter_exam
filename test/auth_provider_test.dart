
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_exam/providers/auth_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AuthProvider', () {
    late AuthProvider authProvider;
    late SharedPreferences sharedPreferences;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      sharedPreferences = await SharedPreferences.getInstance();
      authProvider = AuthProvider();
    });

    test('initial state is logged out', () {
      expect(authProvider.user, null);
    });

    test('signUp creates a new user and logs them in', () async {
      final success = await authProvider.signUp('testuser', 'test@example.com', 'password');

      expect(success, true);
      expect(authProvider.user?.username, 'testuser');

      final usersJson = sharedPreferences.getString('users');
      final users = jsonDecode(usersJson!) as List;
      expect(users.length, 1);
      expect(users.first['username'], 'testuser');
    });

    test('signUp returns false if username already exists', () async {
      await authProvider.signUp('testuser', 'test@example.com', 'password');
      final success = await authProvider.signUp('testuser', 'another@example.com', 'password123');

      expect(success, false);
    });

    test('login with correct credentials returns true and updates user', () async {
      await authProvider.signUp('testuser', 'test@example.com', 'password');
      await authProvider.logout();

      final success = await authProvider.login('testuser', 'password');

      expect(success, true);
      expect(authProvider.user?.username, 'testuser');
    });

    test('login with incorrect credentials returns false', () async {
      await authProvider.signUp('testuser', 'test@example.com', 'password');
      await authProvider.logout();

      final success = await authProvider.login('testuser', 'wrongpassword');

      expect(success, false);
      expect(authProvider.user, null);
    });

    test('logout clears the user from the state and removes last logged in user', () async {
      await authProvider.signUp('testuser', 'test@example.com', 'password');
      await authProvider.logout();

      expect(authProvider.user, null);
      expect(sharedPreferences.getString('last_logged_in_user'), null);
    });

    test('loadUser loads the last logged in user', () async {
      await authProvider.signUp('testuser1', 'test1@example.com', 'password');
      await authProvider.signUp('testuser2', 'test2@example.com', 'password');
      await authProvider.logout();

      await sharedPreferences.setString('last_logged_in_user', 'testuser1');

      await authProvider.loadUser();

      expect(authProvider.user?.username, 'testuser1');
    });
  });
}
