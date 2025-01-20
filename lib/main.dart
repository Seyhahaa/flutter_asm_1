import 'package:flutter/material.dart';
import 'package:flutter_pro_1/language_logic.dart';
import 'package:flutter_pro_1/login_screen.dart';
import 'package:flutter_pro_1/theme_logic.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(provider());
}

Widget provider(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeLogic()),
    ChangeNotifierProvider(create: (create) => LanguageLogic()),
  ],
  child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode mode = context.watch<ThemeLogic>().mode;
    Color light = Color.fromARGB(255, 145, 30, 4);
    Color dark = Colors.blueGrey.shade900;
    return MaterialApp(
      
      home: LoginScreen(),
      themeMode: mode,
      theme: ThemeData(
        brightness: Brightness.light,

        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,

      ),

    );
  }
}
