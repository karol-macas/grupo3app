import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'CustomAppBar.dart';

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
      appBar: CustomAppBar(
        title: 'Ejercicio 2: Calcular sueldo',
      ),
      backgroundColor: Color.fromARGB(255, 243, 218, 201),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildInputField(
                controller: _nameController,
                labelText: "Nombre del trabajador",
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                controller: _hoursController,
                labelText: "Horas trabajadas (semanal)",
                icon: Icons.timer_outlined,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 20),
              _buildInputField(
                controller: _salaryPerHourController,
                labelText: "Sueldo por hora",
                icon: Icons.work_history_outlined,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: computeSalary,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 235, 65, 65),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  textStyle: const TextStyle(
                    fontFamily: "OleoScript",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Calcular sueldo",
                    style:
                        TextStyle(color: Color.fromARGB(255, 248, 243, 243))),
              ),
              const SizedBox(height: 30),
              Container(
                color: Colors.white,
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

  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Color.fromARGB(255, 244, 233, 233),
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: "OleoScript",
          fontSize: 17.0,
          color: Color.fromARGB(255, 234, 86, 18),
        ),
        prefixIcon: Icon(icon, color: Color.fromARGB(255, 249, 27, 72)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 225, 89, 15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 232, 86, 14),
            width: 2.0,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      ),
      style: const TextStyle(fontSize: 20.0),
    );
  }

  TableRow _buildTableRow(String label, double value) {
    return TableRow(
      children: [
        Container(
          color: Color.fromARGB(255, 72, 217, 10).withOpacity(0.2),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courgette',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: Color.fromARGB(255, 233, 126, 44).withOpacity(0.1),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            value.toStringAsFixed(2),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courgette',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
