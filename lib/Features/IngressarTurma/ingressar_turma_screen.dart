import 'package:flutter/material.dart';

class IngressarTurmaScreen extends StatefulWidget {
  @override
  _IngressarTurmaScreenState createState() => _IngressarTurmaScreenState();
}

class _IngressarTurmaScreenState extends State<IngressarTurmaScreen> {
  final _codigoTurmaController = TextEditingController();
  bool _isTextFieldEmpty = true;
  bool _isCodigoInvalido = false;
  final String _codigoCorreto = "NEFO2l";

  @override
  void initState() {
    super.initState();
    _codigoTurmaController.addListener(_textFieldListener);
  }

  @override
  void dispose() {
    _codigoTurmaController.dispose();
    super.dispose();
  }

  // Listener para verificar se o campo de texto está vazio ou se o código foi alterado
  void _textFieldListener() {
    setState(() {
      _isTextFieldEmpty = _codigoTurmaController.text.isEmpty;
      _isCodigoInvalido = false; // Reseta o erro ao digitar
    });
  }

  // Valida o código inserido
  void _validarCodigo() {
    if (_codigoTurmaController.text == _codigoCorreto) {
      Navigator.pushNamed(context, '/sucesso');
    } else {
      setState(() {
        _isCodigoInvalido = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.lightBlue[50], // Cor de fundo da tela
      body: _buildBody(),
    );
  }

  // Constrói a AppBar com ícone e título
  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Image.asset(
          'assets/img/arrow-right.png',
          width: 30,
          height: 30,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Ingressar em uma turma',
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }

  // Constrói o corpo da tela com campo de texto e botão
  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(),
            SizedBox(height: 8.0),
            _buildTextField(),
            if (_isCodigoInvalido) _buildErrorMessage(),
            SizedBox(height: 16.0),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  // Constrói o título da tela
  Widget _buildTitle() {
    return Text(
      'Insira o código da turma',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
        color: Colors.black,
      ),
    );
  }

  // Constrói o campo de texto
  Widget _buildTextField() {
    return SizedBox(
      width: double.infinity, // Ocupa toda a largura disponível
      child: TextField(
        controller: _codigoTurmaController,
        decoration: InputDecoration(
          hintText: 'Insira o código da turma',
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  // Exibe a mensagem de erro se o código for inválido
  Widget _buildErrorMessage() {
    return SizedBox(
      height: 8.0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'CÓDIGO DA TURMA INSERIDO É INVÁLIDO',
          style: TextStyle(
            color: Colors.red,
            fontSize: 10.0,
            fontFamily: 'Satoshi',
          ),
        ),
      ),
    );
  }

  // Constrói o botão "Ingressar"
  Widget _buildButton() {
    return SizedBox(
      width: 300,
      height: 48,
      child: ElevatedButton(
        onPressed: _isTextFieldEmpty ? null : _validarCodigo,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(
              color: Color(0X4F4F4F4F),
              width: 2,
            ),
          ),
        ),
        child: const Text(
          "Ingressar",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
