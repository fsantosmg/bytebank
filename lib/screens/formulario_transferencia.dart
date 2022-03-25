import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

const _tituloAppBar = 'Criando Tranferência';
const _rotuloCampoNumeroConta ='Numero da conta';
const _dicaCampoNumeroConta = '0000';
const _rotuloCampoValor ='Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _controladorCampoNumeroConta,
              labelText: _rotuloCampoNumeroConta,
              hintText: _dicaCampoNumeroConta,
            ),
            Editor(
              controller: _controladorCampoValor,
              labelText: _rotuloCampoValor ,
              hintText: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
                onPressed: () => _criaTranferencia(context),
                child: const Text(_textoBotaoConfirmar))
          ],
        ),
      ),
    );
  }

  void _criaTranferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
