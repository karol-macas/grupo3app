import 'package:flutter/material.dart';

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
        onTrailingPressed: () {
          // Acción a realizar al presionar el ícono trailing
        },
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _saldoAnteriorController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Saldo Anterior',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _montoComprasController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Monto de Compras',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _pagoAnteriorController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Pago Anterior',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcular,
                child: Text('Calcular'),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.white,
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    _buildTableRow('Saldo Actual', saldoActual ?? 0),
                    _buildTableRow('Saldo Actual con Intereses',
                        saldoActualConIntereses ?? 0),
                    _buildTableRow('Pago Mínimo (15%)', pagoMinimo ?? 0),
                    _buildTableRow(
                        'Pago Sin Intereses (85%)', pagoSinIntereses ?? 0),
                    _buildTableRow(
                        'Intereses Morosos (12% + \$200)', interesesMorosos ?? 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, double value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value.toStringAsFixed(2)),
        ),
      ],
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
