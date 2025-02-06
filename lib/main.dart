import 'package:flutter/material.dart';
// import 'package:nfa/presentation/screen/read_write_nfc_screen.dart';
import 'package:nfcollege/presentation/screen/read_write_nfc_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFC MANAGER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReadWriteNFCScreen()
    );
  }
}
