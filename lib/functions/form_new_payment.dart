import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/alumno.dart';
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/objetos/pago.dart';
import 'package:sistema_gym/objetos/precio.dart';
import 'package:sistema_gym/providers/alumnos_provider.dart';
import 'package:sistema_gym/providers/disciplinas_provider.dart';
import 'package:provider/provider.dart';

class FormNewPayment extends StatefulWidget {
  final Alumno alumno;
  const FormNewPayment({super.key, required this.alumno}
);

  @override
  State<FormNewPayment> createState() => _FormNewPaymentState();
}

class _FormNewPaymentState extends State<FormNewPayment> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  Disciplina? _selectedDiscipline;
  Precio? _selectedPrice;

  @override
  Widget build(BuildContext context) {
    final disciplinasProvider = Provider.of<DisciplinasProvider>(context).disciplinas; // Obtiene la lista de disciplinas del provider
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            
            TextFormField(
              controller: _fechaController,
              decoration: const InputDecoration(labelText: 'Fecha'),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una fecha';
                }
                return null;
              },
            ),
            DropdownButtonFormField<Disciplina>(
              value: widget.alumno.getDisciplina(), // Asignar el valor de la disciplina del alumno
              hint: const Text('Seleccione una disciplina'),
              items: disciplinasProvider.map((Disciplina disciplina) {
                return DropdownMenuItem<Disciplina>(
                  value: disciplina,
                  child: Text(disciplina.getNombre()),
                );
              }).toList(),
              onChanged: (Disciplina? newValue) {
                setState(() {
                  _selectedDiscipline = newValue;
                });
              },
            ),
            DropdownButtonFormField<Precio>(
              value: _selectedDiscipline?.getPrecios().first, // Asignar el valor del precio del alumno
              hint: const Text('Seleccione un precio'),
              items: _selectedDiscipline?.getPrecios().map((Precio precio) {
                return DropdownMenuItem<Precio>(
                  value: precio,
                  child: Text(precio.getPrecio().toString() + ' ' + precio.getCantDias().toString()),
                );
              }).toList(),
              onChanged: (Precio? newValue) {
                setState(() {
                  _selectedPrice = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Aquí puedes manejar el envío del formulario
                  Pago nuevoPago = Pago(
                    id: 1,
                    monto: double.parse(_montoController.text),
                    fechaDePago: DateTime.parse(_fechaController.text),
                    descuento: widget.alumno.getDescuento(), // Asignar el ID de la disciplina
                  );
                  // Guardar el nuevo pago en la base de datos o en el provider
                  Navigator.pop(context, nuevoPago);
                }
              },
              child: const Text('Guardar Pago'),
            ),
          ],
        ),
      ),
    );
  }
}