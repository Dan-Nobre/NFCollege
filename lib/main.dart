import 'package:flutter/material.dart';
import 'package:nfcollege/Features/InitialScreen/View/InitialScreen.dart';


void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App Flutter',
      theme: ThemeData(
        fontFamily: 'Satoshi',
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Padrão: Negrito
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        primarySwatch: Colors.blue,
      ),
      home:  const InitialScreen(),
    );
  }
}
