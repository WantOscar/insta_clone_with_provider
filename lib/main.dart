import 'package:flutter/material.dart';
import 'package:insta_clone/src/ui/app/app.dart';
import 'package:insta_clone/src/ui/app/app_view_model.dart';
import 'package:insta_clone/src/utils/global_variable.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: GlobalVariable.navigatorState,
        theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(elevation: 0.0),
          colorScheme: const ColorScheme.light(
              primary: Colors.white, secondary: Colors.black),
        ),
        home: const App(),
      ),
    );
  }
}
