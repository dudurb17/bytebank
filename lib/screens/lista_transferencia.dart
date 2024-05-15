import 'package:bytebank/screens/formulario_transferencia.dart';
import 'package:flutter/material.dart';

import '../models/transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transFerencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tranferencias'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        itemCount: widget._transFerencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transFerencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade200,
        onPressed: () {
          final Future future = Navigator.push<Transferencia>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then(
            (value) {
              setState(() {
                if (value != null) {
                  widget._transFerencias.add(value);
                }
              });
            },
          );
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transFerencia;

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
