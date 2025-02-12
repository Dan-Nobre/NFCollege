import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'turma_criada_screen.dart'; // Importe a tela TurmaCriadaScreen

class CriarTurmaScreen extends StatefulWidget {
  @override
  _CriarTurmaScreenState createState() => _CriarTurmaScreenState();
}

class _CriarTurmaScreenState extends State<CriarTurmaScreen> {
  // Controladores para os campos de texto
  final TextEditingController _nomeTurmaController = TextEditingController();
  final TextEditingController _localController = TextEditingController();

  // Variáveis para armazenar datas e horários
  DateTime? _inicioAula;
  DateTime? _fimAula;
  TimeOfDay? _horarioInicio;
  TimeOfDay? _horarioFim;

  // Lista de dias da semana e dias selecionados
  final List<String> _diasSemana = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
  final Set<int> _diasSelecionados = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  // Método para construir a AppBar
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Criar Turma",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi',
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          'assets/img/arrow-right.png',
          width: 24,
          height: 24,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  // Método para construir o corpo da tela
  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField("Nome da Turma", "Insira o nome da turma", _nomeTurmaController),
          SizedBox(height: 10),
          _buildDatePicker("Início da Aula", _inicioAula, () => _selecionarDataInicio(context)),
          SizedBox(height: 10),
          _buildDatePicker("Fim da Aula", _fimAula, () => _selecionarDataFim(context)),
          SizedBox(height: 10),
          _buildHorarioSelecionador(),
          SizedBox(height: 10),
          _buildRecorrenciaSelecionador(),
          SizedBox(height: 10),
          _buildTextField("Local", "Insira uma localização", _localController),
          SizedBox(height: 20),
          _buildCriarTurmaButton(),
        ],
      ),
    );
  }

  // Método para construir um campo de texto
  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: (value) => setState(() {}), // Atualiza o estado quando o texto muda
        ),
      ],
    );
  }

  // Método para construir um seletor de data
  Widget _buildDatePicker(String label, DateTime? date, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date == null ? "Selecionar data" : DateFormat("dd/MM/yyyy").format(date)),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Método para construir o seletor de horário
  Widget _buildHorarioSelecionador() {
    return Row(
      children: [
        Expanded(
          child: _buildHorarioButton(_formatTimeOfDay(_horarioInicio), () => _selecionarHorario(context, true)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("→"),
        ),
        Expanded(
          child: _buildHorarioButton(_formatTimeOfDay(_horarioFim), () => _selecionarHorario(context, false)),
        ),
      ],
    );
  }

  // Método para construir um botão de horário
  Widget _buildHorarioButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Icon(Icons.access_time),
          ],
        ),
      ),
    );
  }

  // Método para construir o seletor de dias da semana
  Widget _buildRecorrenciaSelecionador() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dias da Semana", style: TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8.0,
          children: List.generate(_diasSemana.length, (index) {
            bool isSelected = _diasSelecionados.contains(index);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _diasSelecionados.remove(index);
                  } else {
                    _diasSelecionados.add(index);
                  }
                });
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _diasSemana[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  // Método para construir o botão "Criar Turma"
  Widget _buildCriarTurmaButton() {
    return Center(
      child: SizedBox(
        width: 300,
        height: 48,
        child: ElevatedButton(
          onPressed: _todosCamposPreenchidos()
              ? () {
            // Navega para a tela "TurmaCriadaScreen"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TurmaCriadaScreen()),
            );
          }
              : null, // Desabilita o botão se os campos não estiverem preenchidos
          style: ElevatedButton.styleFrom(
            backgroundColor: _todosCamposPreenchidos() ? Colors.green : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(
                color: Color(0X4F4F4F4F),
                width: 2,
              ),
            ),
          ),
          child: const Text(
            "Criar Turma",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Método para selecionar a data de início
  Future<void> _selecionarDataInicio(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _inicioAula) {
      setState(() {
        _inicioAula = picked;
      });
    }
  }

  // Método para selecionar a data de fim
  Future<void> _selecionarDataFim(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _fimAula) {
      setState(() {
        _fimAula = picked;
      });
    }
  }

  // Método para selecionar o horário
  Future<void> _selecionarHorario(BuildContext context, bool inicio) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (inicio) {
          _horarioInicio = picked;
        } else {
          _horarioFim = picked;
        }
      });
    }
  }

  // Método para formatar o horário
  String _formatTimeOfDay(TimeOfDay? time) {
    if (time == null) return "Selecionar horário";
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat("hh:mm a").format(dt);
  }

  // Método para verificar se todos os campos estão preenchidos
  bool _todosCamposPreenchidos() {
    return _nomeTurmaController.text.isNotEmpty &&
        _inicioAula != null &&
        _fimAula != null &&
        _horarioInicio != null &&
        _horarioFim != null &&
        _diasSelecionados.isNotEmpty &&
        _localController.text.isNotEmpty;
  }
}