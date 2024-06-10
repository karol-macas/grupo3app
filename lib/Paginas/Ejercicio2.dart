import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({super.key});

  @override
  Ejercicio2State createState() => Ejercicio2State();
}

class Ejercicio2State extends State<Ejercicio2> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _salaryPerHourController =
      TextEditingController();
  double _salary = 0;
  double _discount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2: Calcular sueldo'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Nombre del trabajador",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              controller: _hoursController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Horas trabajadas (semanal)",
                prefixIcon: Icon(Icons.timer_outlined),
              ),
            ),
            TextField(
              controller: _salaryPerHourController,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                labelText: "Sueldo por hora",
                prefixIcon: Icon(Icons.work_history_outlined),
              ),
            ),
            ElevatedButton(
              onPressed: computeSalary,
              child: const Text("Calcular sueldo"),
            ),
            Container(
              color: Colors.white,
              child: Table(
                border: TableBorder.all(),
                children: [
                  _buildTableRow("Sueldo bruto", _salary),
                  _buildTableRow("Descuento", _discount),
                  _buildTableRow(
                      "Sueldo total", _salary - (_salary * _discount)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double selectDiscount(double salary) {
    if (salary > 0 && salary < 150) return .05;
    if (salary > 150 && salary < 300) return .07;
    if (salary > 300 && salary < 450) return .05;

    return 0;
  }

  void computeSalary() {
    setState(() {
      double hours = double.tryParse(_hoursController.text) ?? .0;
      double salaryPerHour =
          double.tryParse(_salaryPerHourController.text) ?? 0;

      if (hours < 0 || salaryPerHour < 0) return;

      _salary = hours * salaryPerHour;
      _discount = selectDiscount(_salary);
    });
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
