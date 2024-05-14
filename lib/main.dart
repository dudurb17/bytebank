import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

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
          backgroundColor: Colors.blue.shade200,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(fontSize: 24.0),
                decoration: const InputDecoration(
                    labelText: "Número da conta", hintText: "0000"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(fontSize: 24.0),
                decoration: const InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: "Valor",
                    hintText: "0.00"),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("clicou no confirmar");

                final int? numeroConta =
                    int.tryParse(_controladorCampoNumeroConta.text);
                final double? valor =
                    double.tryParse(_controladorCampoValor.text);
                if (numeroConta != null && valor != null) {
                  final transFerenciaCriada =
                      TransFerencia(numeroConta: numeroConta, valor: valor);
                  debugPrint("$transFerenciaCriada");
                }
              },
              child: Text("Confirmar"),
            )
          ],
        ));
  }
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      body: FormularioTransferencia(),
    ));
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tranferencias'),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(TransFerencia(valor: 50.30, numeroConta: 65)),
          ItemTransferencia(TransFerencia(valor: 79090.30, numeroConta: 85)),
          ItemTransferencia(TransFerencia(valor: 8762, numeroConta: 40)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade200,
        onPressed: () => {},
      ),
    );
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

  @override
  String toString() {
    // TODO: implement toString
    return "Tranferencia {valor: $valor, numero da conta:$numeroConta}";
  }
}
