import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:practice_app/auth/login_screen.dart';
import 'package:practice_app/homepage/home_page.dart';
import 'package:practice_app/theme/theme_provider.dart';
import 'package:practice_app/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'auth/logout_timer_provider.dart';
import 'auth/user_manager.dart';
import 'theme/text.dart';
import 'theme/theme.dart';

void main() async {
  await LocalStoragePref().initPrefBox();
  await UserManager().init();
  configLoading();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LogoutTimerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.light
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = true;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    checkLogin;
  }

  checkLogin() {
    bool loginStatus = LocalStoragePref().getLoginBool() ?? false;
    setState(() {
      isLogin = loginStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MaterialTheme(textTheme).lightMediumContrast(),
      // darkTheme: MaterialTheme(textTheme).lightMediumContrast(),
      darkTheme: MaterialTheme(textTheme).darkMediumContrast(),
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      // initialRoute: isLogin ? '/' : '/login',
      builder: EasyLoading.init(),
      routes: {
        '/': (context) => const MyHomePage(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
