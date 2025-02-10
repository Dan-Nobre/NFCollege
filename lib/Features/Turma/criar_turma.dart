import 'package:flutter/material.dart';

class CriarTurmaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Turma"),
        backgroundColor: Colors.blue[50],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("NOME DA TURMA", "Insira o nome da turma"),
            _buildImagePicker("INÍCIO DA AULA", "Resources/assets/images/calendar.png"),
            _buildImagePicker("FIM DA AULA", "Resources/assets/images/calendar.png"),
            Row(
              children: [
                Expanded(child: _buildImagePicker("HORÁRIOS", "Resources/assets/images/time.png")),
                SizedBox(width: 10),
                Icon(Icons.arrow_right_alt, size: 28),
                SizedBox(width: 10),
                Expanded(child: _buildImagePicker("", "Resources/assets/images/time.png")),
              ],
            ),
            SizedBox(height: 16),
            Text("RECORRÊNCIA", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: ["D", "S", "T", "Q", "Q", "S", "S"].map((dia) => _buildCircle(dia)).toList(),
            ),
            SizedBox(height: 16),
            _buildTextField("LOCAL", "Insira uma localização", isLocation: true),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
                child: const Text("Salvar",
                  style: TextStyle(color: Colors.white,)),
            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isLocation = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            prefixIcon: isLocation ? Image.asset("Resources/assets/images/location.png", width: 24) : null,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImagePicker(String label, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Image.asset(imagePath, width: 24),
            title: Text("Selecionar"),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildCircle(String text) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue),
      ),
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(color: Colors.blue)),
    );
  }
}
