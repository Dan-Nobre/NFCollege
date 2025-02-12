import 'package:flutter/material.dart';

// ignore: camel_case_types
class screen_turma extends StatelessWidget {
  const screen_turma({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Programação Orientada a Objetos',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInfoBox(
                      '📅 Seg - Qua      🕒 13:30 - 15:30      📍 Bloco 3 - Sala 1',
                      Colors.transparent,
                      Colors.black,
                      Alignment.topLeft),
                  _buildInfoBox('Membros', const Color(0xFF152E56),
                      Colors.white, Alignment.topLeft),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(
      String text, Color color, Color textColor, Alignment alignment) {
    return Container(
      width: 150,
      height: 80,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (color != Colors.transparent)
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
        ],
      ),
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FaltasWidget extends StatelessWidget {
  final String nome = "Ian Pacini Araujo";
  final int faltas = 12;
  final int totalFaltas = 20;

  const FaltasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nome,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              width: (faltas / totalFaltas) * MediaQuery.of(context).size.width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$faltas/$totalFaltas Faltas',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
