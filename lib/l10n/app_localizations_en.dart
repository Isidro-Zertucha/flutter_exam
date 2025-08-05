// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account? Sign up';

  @override
  String get signUp => 'Sign Up';

  @override
  String get email => 'Email';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get alreadyHaveAnAccount => 'Already have an account? Login';

  @override
  String get home => 'Home';

  @override
  String welcome(Object username) {
    return 'Welcome, $username!';
  }

  @override
  String get logout => 'Logout';

  @override
  String get invalidUsernameOrPassword => 'Invalid username or password';

  @override
  String get usernameAlreadyExists => 'Username already exists';

  @override
  String get pleaseEnterAUsername => 'Please enter a username';

  @override
  String get pleaseEnterAnEmail => 'Please enter an email';

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Please enter a valid email address';

  @override
  String get pleaseEnterAPassword => 'Please enter a password';

  @override
  String get pleaseConfirmYourPassword => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';
}
