import 'package:flutter/material.dart';
import 'package:movies_new/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies New App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':(_)=> const HomeScreen(),
        'details':(_)=> const DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple
        )
      )
    );
  }
}