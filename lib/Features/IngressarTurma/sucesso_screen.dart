import 'package:flutter/material.dart';

class SucessoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: _buildBody(context),
    );
  }

  // Constrói o corpo da tela com as informações de sucesso
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMessage(),
            SizedBox(height: 16.0),
            _buildImage(),
            SizedBox(height: 16.0),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  // Constrói a mensagem de sucesso
  Widget _buildMessage() {
    return Text(
      'Você ingressou em Programação Orientada a Objetos',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );
  }

  // Constrói a imagem de sucesso
  Widget _buildImage() {
    return Image.asset(
      'assets/img/done.png',
      width: 100.0,
      height: 100.0,
    );
  }

  // Constrói o botão para fechar a tela
  Widget _buildButton(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 48,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(
              color: Color(0X4F4F4F4F),
              width: 2,
            ),
          ),
        ),
        child: const Text(
          "Fechar",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
