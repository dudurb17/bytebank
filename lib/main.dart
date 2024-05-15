import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

//erro no retornar do form para mostrar no list, provavelmente retornando fora do type
void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary),
        ),
        home: ListaTransferencias());
  }
}
