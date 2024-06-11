import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'CustomAppBar.dart';

class Ejercicio1 extends StatefulWidget {
  @override
  _Ejercicio1State createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  TextEditingController _saldoAnteriorController = TextEditingController();
  TextEditingController _montoComprasController = TextEditingController();
  TextEditingController _pagoAnteriorController = TextEditingController();

  double? saldoActual;
  double? saldoActualConIntereses;
  double? pagoMinimo;
  double? pagoSinIntereses;
  double? interesesMorosos;

  void _calcular() {
    double saldoAnterior =
        double.tryParse(_saldoAnteriorController.text) ?? 0.0;
    double montoCompras = double.tryParse(_montoComprasController.text) ?? 0.0;
    double pagoAnterior = double.tryParse(_pagoAnteriorController.text) ?? 0.0;

    Cliente cliente = Cliente(
        saldoAnterior: saldoAnterior,
        montoCompras: montoCompras,
        pagoAnterior: pagoAnterior);

    setState(() {
      saldoActual = cliente.calcularSaldoActual();
      saldoActualConIntereses = cliente.calcularSaldoActualConIntereses();
      pagoMinimo = cliente.calcularPagoMinimo();
      pagoSinIntereses = cliente.calcularPagoSinIntereses();
      interesesMorosos = cliente.calcularInteresesMorosos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'BANCO "BANDIDO PELUCHE"',
      ),
      backgroundColor: Color.fromARGB(255, 236, 177, 194),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField('Saldo Anterior', _saldoAnteriorController),
              SizedBox(height: 20),
              _buildInputField('Monto de Compras', _montoComprasController),
              SizedBox(height: 20),
              _buildInputField('Pago Anterior', _pagoAnteriorController),
              SizedBox(height: 20),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 215, 27, 27).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: _calcular,
                  style: ElevatedButton.styleFrom(
                    elevation: 25,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'CALCULAR',
                    style: TextStyle(
                      fontSize: 22.0,
                      backgroundColor: Color.fromARGB(255, 238, 228, 228),
                      color: Color.fromARGB(255, 179, 11, 146),
                      fontFamily: 'Super Creamy Personal Use',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                color: Color.fromARGB(255, 251, 217, 217),
                child: Table(
                  border: TableBorder.all(
                    color: Color.fromARGB(255, 227, 30, 56).withOpacity(0.6),
                    width: 4.0,
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  children: [
                    _buildTableRow('Saldo Actual', saldoActual ?? 0),
                    _buildTableRow('Saldo Actual con Intereses',
                        saldoActualConIntereses ?? 0),
                    _buildTableRow('Pago Mínimo (15%)', pagoMinimo ?? 0),
                    _buildTableRow(
                        'Pago Sin Intereses (85%)', pagoSinIntereses ?? 0),
                    _buildTableRow('Intereses Morosos (12% + \$200)',
                        interesesMorosos ?? 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 228, 228),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 215, 27, 27).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, double value) {
    return TableRow(
      children: [
        _buildTableCell(label, Color.fromARGB(255, 247, 235, 235)),
        _buildTableCell(
            value.toStringAsFixed(2), Color.fromARGB(255, 251, 217, 217)),
      ],
    );
  }

  TableCell _buildTableCell(String content, Color color) {
    return TableCell(
      child: Container(
        color: color,
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontFamily: 'Courgette',
              )),
        ),
      ),
    );
  }
}

class Cliente {
  double saldoAnterior;
  double montoCompras;
  double pagoAnterior;

  Cliente(
      {required this.saldoAnterior,
      required this.montoCompras,
      required this.pagoAnterior});

  double calcularSaldoActual() {
    return saldoAnterior + montoCompras - pagoAnterior;
  }

  double calcularPagoMinimo() {
    double saldoActual = calcularSaldoActual();
    return saldoActual * 0.15;
  }

  double calcularPagoSinIntereses() {
    double saldoActual = calcularSaldoActual();
    return saldoActual * 0.85;
  }

  double calcularInteresesMorosos() {
    double saldoActual = calcularSaldoActual();
    double pagoMinimo = calcularPagoMinimo();
    if (pagoAnterior < pagoMinimo) {
      double intereses = saldoActual * 0.12;
      return intereses + 200;
    } else {
      return 0.0;
    }
  }

  double calcularSaldoActualConIntereses() {
    double saldoActual = calcularSaldoActual();
    double pagoMinimo = calcularPagoMinimo();
    if (pagoAnterior < pagoMinimo) {
      saldoActual += calcularInteresesMorosos();
    }
    return saldoActual;
  }
}
