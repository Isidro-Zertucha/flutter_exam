import 'package:flutter/material.dart';
import 'package:flutter_exam/main.dart';
import 'package:flutter_exam/l10n/app_localizations.dart';
import 'package:flutter_exam/screens/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_exam/providers/auth_provider.dart';
import 'package:flutter_exam/providers/locale_provider.dart';
import 'package:flutter_exam/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_exam/models/user_model.dart';
import 'dart:convert';

void main() {
  setUp(() {
    // Reset SharedPreferences before each test
    SharedPreferences.setMockInitialValues({});
  });

  Widget createTestableWidget({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: MaterialApp(
        home: child,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  group('Internationalization', () {
    testWidgets('displays in English by default', (tester) async {
      await tester.pumpWidget(createTestableWidget(child: const MyApp()));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    });

    testWidgets('displays in Spanish when locale is changed', (tester) async {
      // Pre-populate SharedPreferences to simulate a logged-in user
      final prefs = await SharedPreferences.getInstance();
      final user = UserModel(username: 'testuser', email: 'test@example.com', password: 'password');
      await prefs.setString('last_logged_in_user', user.username);
      await prefs.setString('users', jsonEncode([user.toJson()]));

      await tester.pumpWidget(createTestableWidget(child: const MyApp()));
      await tester.pumpAndSettle();

      // Ensure HomeScreen is displayed after login
      expect(find.byType(HomeScreen), findsOneWidget);

      // Open the language selection menu
      await tester.tap(find.byIcon(Icons.language));
      await tester.pumpAndSettle();

      // Tap on the Spanish language option
      await tester.tap(find.text('Español'));
      await tester.pumpAndSettle();

      // Verify that the welcome message text has changed to Spanish
      expect(find.text('¡Bienvenido, testuser!'), findsOneWidget);
    });
  });
}