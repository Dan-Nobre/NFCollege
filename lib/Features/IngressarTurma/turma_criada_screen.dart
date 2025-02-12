import 'package:flutter/material.dart';

class TurmaCriadaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: _buildBody(context),
    );
  }

  // Constrói o corpo da tela de turma criada
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            SizedBox(height: 20),
            _buildDescription(),
            SizedBox(height: 10),
            _buildCodeLabel(),
            SizedBox(height: 10),
            _buildCodeDisplay(),
            SizedBox(height: 20),
            _buildLinkLabel(),
            _buildLink(),
            SizedBox(height: 40),
            _buildCloseButton(context),
          ],
        ),
      ),
    );
  }

  // Constrói o título "Turma Criada"
  Widget _buildTitle() {
    return Text(
      'Turma Criada',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
        color: Colors.black,
      ),
    );
  }

  // Constrói a descrição "Sua turma foi criada!"
  Widget _buildDescription() {
    return Text(
      'Sua turma foi criada!',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Constrói o texto "O código para entrar na turma é:"
  Widget _buildCodeLabel() {
    return Text(
      'O código para entrar na turma é:',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
        color: Colors.black,
      ),
    );
  }

  // Constrói o container que exibe o código da turma
  Widget _buildCodeDisplay() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'NEFO2I',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Satoshi',
              color: Colors.black,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.copy, size: 20, color: Colors.grey),
        ],
      ),
    );
  }

  // Constrói o texto "Link para ingressar:"
  Widget _buildLinkLabel() {
    return Text(
      'Link para ingressar: ',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
        color: Colors.black,
      ),
    );
  }

  // Constrói o link clicável para ingressar na turma
  Widget _buildLink() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'https://url.com.br',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi',
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  // Constrói o botão de fechar
  Widget _buildCloseButton(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
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

