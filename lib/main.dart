import 'package:flutter/material.dart';
import 'services/localization_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale(ui.window.locale.languageCode);

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('pt', ''),
      ],
      localizationsDelegates: [
        AppLocalization.delegate,
      ],
      home: MyHomePage(onLanguageChange: _changeLanguage),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(Locale) onLanguageChange;

  MyHomePage({required this.onLanguageChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).translate('welcome')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onLanguageChange(Locale('en')),
              child: Text('English'),
            ),
            ElevatedButton(
              onPressed: () => onLanguageChange(Locale('pt')),
              child: Text('Português'),
            ),
          ],
        ),
      ),
    );
  }
}