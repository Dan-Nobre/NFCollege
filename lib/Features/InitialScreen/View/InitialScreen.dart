import 'package:flutter/material.dart';
import 'package:nfcollege/Features/components/modal_bottom_sheet.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset("Resources/assets/images/user-icon.png"),
            onPressed: () {
              // navega para o perfil (falta implementar no figma)
            },
          ),
        actions: [
          IconButton(
            icon: Image.asset("Resources/assets/images/addButton.png"),
            onPressed: () {
              showTurmaModal(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Bem vindo, ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff6893D5)),
                ),

                const Text(
                  'Ian Pacini',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Suas turmas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Navega para a tela de todas as turmas (esperar código)
                  },
                  child: const Text(
                    'Ver todas',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 250),
            const Center(
              child: Text(
                'Toque no botão de + para criar ou ingressar em uma turma',
                style: TextStyle(fontSize: 18, color: Color(0xFF7A7777)),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(), 
          ],
        ),
      ),
    );
  }
}