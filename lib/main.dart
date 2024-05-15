import 'package:flutter/material.dart';

//erro no retornar do form para mostrar no list, provavelmente retornando fora do type
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

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icon;

  Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      body: ListaTransferencias(),
    ));
  }
}

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
        backgroundColor: Colors.blue.shade200,
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

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia({required this.valor, required this.numeroConta});

  @override
  String toString() {
    // TODO: implement toString
    return "Tranferencia {valor: $valor, numero da conta:$numeroConta}";
  }
}
