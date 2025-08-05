// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get login => 'Iniciar sesión';

  @override
  String get username => 'Usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get dontHaveAnAccount => '¿No tienes una cuenta? Regístrate';

  @override
  String get signUp => 'Registrarse';

  @override
  String get email => 'Correo electrónico';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get alreadyHaveAnAccount => '¿Ya tienes una cuenta? Inicia sesión';

  @override
  String get home => 'Inicio';

  @override
  String welcome(Object username) {
    return '¡Bienvenido, $username!';
  }

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get invalidUsernameOrPassword => 'Usuario o contraseña inválidos';

  @override
  String get usernameAlreadyExists => 'El nombre de usuario ya existe';

  @override
  String get pleaseEnterAUsername =>
      'Por favor, introduce un nombre de usuario';

  @override
  String get pleaseEnterAnEmail => 'Por favor, introduce un correo electrónico';

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Por favor, introduce una dirección de correo electrónico válida';

  @override
  String get pleaseEnterAPassword => 'Por favor, introduce una contraseña';

  @override
  String get pleaseConfirmYourPassword => 'Por favor, confirma tu contraseña';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';
}
