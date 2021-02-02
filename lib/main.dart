
import 'package:flutter/material.dart';
import 'package:teams_soccer/src/teams/ui/screens/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : (_) => HomePage()
      },
    );
  }
}