import 'package:flutter/material.dart';

class Ejercicio2 extends StatefulWidget {
  @override
  _Ejercicio2State createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  final TextEditingController valueController = TextEditingController();
  int cifra = 0;
  String message = '';

  void _contarCifras() {
    final input = valueController.text;

    // Clear previous message
    setState(() {
      message = '';
    });

    if (input.isEmpty) {
      setState(() {
        message = 'Por favor, ingrese un número.';
      });
      return;
    }

    final number = int.tryParse(input);
    if (number == null) {
      setState(() {
        message = 'Por favor, ingrese un número válido.';
      });
      return;
    }

    if (number < 0) {
      setState(() {
        message = 'El número no debe ser negativo.';
      });
      return;
    }

    setState(() {
      cifra = input.length;
      message = 'El número de dígitos es: $cifra';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Ejercicio 1: Contar Cifras'),
          backgroundColor: Colors.purpleAccent
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _contarCifras,
              child: Text('Contar cifras'),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: Ejercicio2(),
));
