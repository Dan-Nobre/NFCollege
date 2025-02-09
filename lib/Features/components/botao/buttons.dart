import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            width: 300,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print("Adc");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(
                    color: Color(0X4F4F4F4F),
                    width: 2,
                  ),
                ),
              ),
              child: const Text("Ingressar",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
