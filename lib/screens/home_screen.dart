
import 'package:flutter/material.dart';
import 'package:flutter_exam/l10n/app_localizations.dart';
import 'package:country_flags/country_flags.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (locale) {
              Provider.of<LocaleProvider>(context, listen: false).setLocale(locale);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
              PopupMenuItem<Locale>(
                value: Locale('en'),
                child: Row(
                  children: [
                    CountryFlag.fromCountryCode(
                      'GB',
                      height: 20,
                      width: 30,
                      borderRadius: 8,
                    ),
                    SizedBox(width: 8),
                    Text('English'),
                  ],
                ),
              ),
              PopupMenuItem<Locale>(
                value: Locale('es'),
                child: Row(
                  children: [
                    CountryFlag.fromCountryCode(
                      'ES',
                      height: 20,
                      width: 30,
                      borderRadius: 8,
                    ),
                    SizedBox(width: 8),
                    Text('Español'),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.welcome(authProvider.user!.username),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${l10n.email}: ${authProvider.user?.email}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
