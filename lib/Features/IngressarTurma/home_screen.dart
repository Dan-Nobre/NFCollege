import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModal(context),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Clique no botão "+" para adicionar ou ingressar em uma turma.',
        ),
      ),
    );
  }

  // Método que exibe o modal com as opções para criar ou ingressar em uma turma
  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              _buildListTile(
                context,
                image: 'assets/img/create-room.png',
                title: 'Criar uma turma',
                subtitle: 'Crie uma turma para registrar presenças.',
                route: '/criarTurma',
              ),
              Divider(),

              _buildListTile(
                context,
                image: 'assets/img/enter-room.png',
                title: 'Ingressar em uma turma',
                subtitle: 'Entre em uma turma já criada.',
                route: '/ingressar',
              ),
            ],
          ),
        );
      },
    );
  }

  // Método auxiliar para criar cada ListTile
  ListTile _buildListTile(
      BuildContext context, {
        required String image,
        required String title,
        required String subtitle,
        required String route,
      }) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 30,
        height: 30,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
