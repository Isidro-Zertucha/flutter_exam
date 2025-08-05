import 'package:flutter/material.dart';

import 'package:flutter_exam/screens/login_screen.dart';
import 'package:flutter_exam/screens/signup_screen.dart';
import 'package:flutter_exam/l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_exam/providers/auth_provider.dart';
import 'package:flutter_exam/providers/locale_provider.dart';
import 'package:flutter_exam/providers/theme_provider.dart';

void main() {
  // We need a common wrapper for tests that provides the necessary Provider
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

  group('LoginScreen Validation', () {
    testWidgets('shows error when username is empty', (tester) async {
      await tester.pumpWidget(createTestableWidget(child: LoginScreen()));

      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump(); // Rebuild the widget after the state has changed.

      expect(find.text('Please enter a username'), findsOneWidget);
    });

    testWidgets('shows error when password is empty', (tester) async {
      await tester.pumpWidget(createTestableWidget(child: LoginScreen()));

      await tester.enterText(find.byType(TextFormField).first, 'testuser');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump();

      expect(find.text('Please enter a password'), findsOneWidget);
    });
  });

  group('SignUpScreen Validation', () {
    testWidgets('shows error for empty fields', (tester) async {
      await tester.pumpWidget(createTestableWidget(child: SignUpScreen()));

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      expect(find.text('Please enter a username'), findsOneWidget);
      expect(find.text('Please enter an email'), findsOneWidget);
      expect(find.text('Please enter a password'), findsOneWidget);
    });

    testWidgets('shows error for invalid email', (tester) async {
      await tester.pumpWidget(createTestableWidget(child: SignUpScreen()));

      await tester.enterText(
          find.widgetWithText(TextFormField, 'Email'), 'invalid-email');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('shows error when passwords do not match', (tester) async {
      await tester.pumpWidget(createTestableWidget(child: SignUpScreen()));
      
      await tester.enterText(find.widgetWithText(TextFormField, 'Username'), 'test');
      await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'test@test.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'), 'password123');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Confirm Password'),
          'password456');

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      expect(find.text('Passwords do not match'), findsOneWidget);
    });
  });
}
