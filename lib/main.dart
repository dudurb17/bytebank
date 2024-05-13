import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: ListaTransferencia(),
          appBar: AppBar(
              title: const Text('Tranferencias'),
              backgroundColor: Colors.blue.shade200),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue.shade200,
            onPressed: () => {},
          ),
        ),
      ),
    );

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ItemTransferencia(TransFerencia(valor: 50.30, numeroConta: 65)),
      ItemTransferencia(TransFerencia(valor: 79090.30, numeroConta: 85)),
      ItemTransferencia(TransFerencia(valor: 8762, numeroConta: 40)),
    ]);
  }
}

class ItemTransferencia extends StatelessWidget {
  final TransFerencia _transFerencia;

  ItemTransferencia(this._transFerencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transFerencia.valor.toString()),
      subtitle: Text(_transFerencia.numeroConta.toString()),
    ));
  }
}

class TransFerencia {
  final double valor;
  final int numeroConta;

  TransFerencia({required this.valor, required this.numeroConta});
}
