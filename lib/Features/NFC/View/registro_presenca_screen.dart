import 'package:flutter/material.dart';

class RegistroPresencaScreen extends StatelessWidget {
  const RegistroPresencaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Presença',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            _buildCardImage(),
            const SizedBox(height:83),
            _buildMessage(),
            const SizedBox(height: 250),
            _buildParticipantInfo(),
            const SizedBox(height: 32),
            _buildRedButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage() {
    return Image.asset(
      'assets/card_generic.png',
      width: 150,
      height: 150,
    );
  }

  Widget _buildMessage() {
    return const Text(
      'Aproxime o cartão do celular',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildParticipantInfo() {
    return Column(
      children: const [
        Text(
          'IAN PACINI ARAUJO',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 10),
        Text(
          '24 / 02 / 2025',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

Widget _buildRedButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: () {
          // Navigator.pop(context); 
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, 
          padding: const EdgeInsets.all(20), 
          shape: const CircleBorder(),
          side: BorderSide(
            color: const Color(0xFFD32F2F), // Cor hexadecimal da borda (#D32F2F)
            width: 3,
          ),
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }