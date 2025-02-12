import 'package:flutter/material.dart';
import 'package:nfcollege/Features/IngressarTurma/ingressar_turma_screen.dart';
import 'package:nfcollege/Features/Turma/criar_turma.dart';

class AddModal extends StatelessWidget {
  const AddModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20,),
          _buildOption(
            icon: Image.asset("Resources/assets/images/create-room.png", width: 28, height: 28), 
            title: "Criar uma turma",
            subtitle: "Crie uma turma para registrar presenças.",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CriarTurmaScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildOption(
            icon: Image.asset("Resources/assets/images/enter-room.png", width: 28, height: 28), 
            title: "Ingressar em uma turma",
            subtitle: "Entre em uma turma já criada.",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IngressarTurmaScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required Widget icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showTurmaModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => const AddModal(),
  );
}
