import 'package:flutter/material.dart';
import 'package:practice_app/homepage/home_page.dart';
import 'package:practice_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'theme/text.dart';
import 'theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MaterialTheme(textTheme).lightMediumContrast(),
      darkTheme: MaterialTheme(textTheme).darkMediumContrast(),
      themeMode: themeProvider.themeMode,
      home: const MyHomePage(),
    );
  }
}
