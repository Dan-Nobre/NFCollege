import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // navega para o perfil 
            },
          ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // adicionar tela do modal.
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bem vindo, Ian Pacini',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    // Navega para a tela de todas as turmas
                  },
                  child: const Text(
                    'Ver todas',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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