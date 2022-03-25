import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
            ).copyWith(
              secondary: Colors.greenAccent[900],
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent[900],
            )),
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.greenAccent[700],
                textTheme: ButtonTextTheme.primary)),
        home: ListaTransferencias());
  }
}








