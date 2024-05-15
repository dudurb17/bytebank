import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

const _titulo = "Criando uma tranferencia";

const _rotuloConta = "Numero da conta";
const _dicaConta = "0000";

const _rotulovalor = "Valor";
const _dicaValor = "0.00";

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titulo),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloConta,
                dica: _dicaConta),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotulovalor,
              dica: _dicaValor,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: const Text("Confirmar"),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transFerenciaCriada =
          Transferencia(numeroConta: numeroConta, valor: valor);
      debugPrint("$transFerenciaCriada");
      Navigator.pop(context, transFerenciaCriada);
    }
  }
}
