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
      ItemTransferencia(titulo: "123213", numeroConta: "20"),
    ]);
  }
}

class ItemTransferencia extends StatelessWidget {
  final String titulo;
  final String numeroConta;

  ItemTransferencia({required this.titulo, required this.numeroConta});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(titulo),
      subtitle: Text(numeroConta),
    ));
  }
}
