import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/gasto.dart';

class FormEditGastos extends StatefulWidget{
  const FormEditGastos({super.key, required this.gasto});
  final Gasto gasto;

  @override
  State<FormEditGastos> createState() => _FormEditGastosState();
}

class _FormEditGastosState extends State<FormEditGastos>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí procesas los datos, por ejemplo:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text('Gasto editado con éxito', style: TextStyle(color: Colors.white)),
            ],
          ),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context, widget.gasto); // Cierra el modal después de guardar
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Editar Gasto',
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: widget.gasto.titulo,
              decoration: const InputDecoration(labelText: 'Nombre del gasto'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, ingrese un nombre' : null,
              onSaved: (value) {
                widget.gasto.titulo = value!;
              },
            ),
            TextFormField(
              initialValue: widget.gasto.monto.toString(),
              decoration: const InputDecoration(labelText: 'Monto del gasto'),
              keyboardType: TextInputType.number,
              validator: (value) => value == null || value.isEmpty ? 'Por favor, ingrese un monto' : null,
              onSaved: (value) {
                widget.gasto.monto = double.parse(value!);
              },
            ),
            TextFormField(
              initialValue: widget.gasto.fecha.toString(),
              decoration: const InputDecoration(labelText: 'Fecha del gasto'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, ingrese una fecha' : null,
              onSaved: (value) {
                widget.gasto.fecha = DateTime.parse(value!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes manejar la lógica para editar el gasto
                _submitForm();
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}