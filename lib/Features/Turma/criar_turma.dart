import 'package:flutter/material.dart';

class CriarTurmaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Turma"),
        centerTitle: true,
        backgroundColor: Colors.blue[50],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("NOME DA TURMA", "Insira o nome da turma"),
            Row(
              children: [
                Expanded(child: _buildImagePicker("INICIO DA AULAS", "Resources/assets/images/Calendario.png", imageSize: 20)),
                SizedBox(width: 10),
              ],
            ),
            Row(
              children: [
                Expanded(child: _buildImagePicker("FIM DAS AULAS", "Resources/assets/images/Calendario.png", imageSize: 20)),
                SizedBox(width: 10),
              ],
            ),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _buildImagePicker("HORÁRIO INÍCIO", "Resources/assets/images/Clock.png", imageSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.arrow_right_alt, size: 28),
              ),
              Expanded(
                child: _buildImagePicker("HORÁRIO FIM", "Resources/assets/images/Clock.png", imageSize: 17),
              ),
            ],
          ),

            SizedBox(height: 16),
            Text("RECORRÊNCIA", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 8,
                  children: ["D", "S", "T", "Q", "Q", "S", "S"].map((dia) => _buildCircle(dia)).toList(),
                ),
              ],
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
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ),
            Spacer(),
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
            prefixIcon: isLocation ? Image.asset("Resources/assets/images/Location.png", width: 24) : null,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImagePicker(String label, String imagePath, {double imageSize = 32}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) 
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            leading: SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            title: Text(
              "12:00",
              style: TextStyle(fontSize: 18), 
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset("Resources/assets/images/Chevron-Down.png"),
            ),
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
