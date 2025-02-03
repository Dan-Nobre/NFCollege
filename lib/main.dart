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
        primarySwatch: Colors.blue,
      ),
      home: const InitialScreen(),
    );
  }
}
