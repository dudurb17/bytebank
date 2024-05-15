import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando uma tranferencia"),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: "Numero da conta",
                dica: "0000"),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: "Valor",
              dica: "0.00",
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