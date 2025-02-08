import 'package:flutter/material.dart';
import 'package:nfcollege/Features/InitialScreen/View/InitialScreen.dart';
// import 'package:nfa/presentation/screen/read_write_nfc_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NFC MANAGER',
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
