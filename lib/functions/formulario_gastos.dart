import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Asegúrate de tener la dependencia intl en pubspec.yaml

class AgregarGastoForm extends StatefulWidget {
  const AgregarGastoForm({Key? key}) : super(key: key);

  @override
  AgregarGastoFormState createState() => AgregarGastoFormState();
}

class AgregarGastoFormState extends State<AgregarGastoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _titulo = "";
  double? _monto;
  DateTime? _fecha;
  String? _descripcion;

  // Controlador para el campo de la fecha (se llenará una vez seleccionada)
  final TextEditingController _fechaController = TextEditingController();

  @override
  void dispose() {
    _fechaController.dispose();
    super.dispose();
  }

  // Método para disparar y seleccionar una fecha mediante DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime initialDate = _fecha ?? now;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _fecha) {
      setState(() {
        _fecha = pickedDate;
        // Formateamos la fecha a dd/MM/yyyy
        _fechaController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  // Método para validar y guardar el formulario
  void _submitForm() {
    if (_formKey.currentState!.validate() && _fecha != null) {
      _formKey.currentState!.save();
      // Aquí procesas los datos, por ejemplo:
      debugPrint("Gasto guardado:");
      debugPrint("Título: $_titulo");
      debugPrint("Monto: $_monto");
      debugPrint("Fecha: ${DateFormat('dd/MM/yyyy').format(_fecha!)}");
      debugPrint("Descripción: $_descripcion");

      ScaffoldMessenger.of(context).showSnackBar(
        const  SnackBar(
          backgroundColor: Colors.green,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text('Gasto registrado con éxito', style: TextStyle(color: Colors.white)),
            ],
          ),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context); // Cierra el modal después de guardar

      // Aquí puedes limpiar el formulario o navegar hacia atrás
    } else {
      if (_fecha == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Por favor, seleccione la fecha")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // El padding ayuda a que el contenido no quede tapado por el teclado
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Agregar Gasto",
            ),
            const SizedBox(height: 16),
            // Campo para el Título
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Título del gasto",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "El título es obligatorio";
                }
                return null;
              },
              onSaved: (value) {
                _titulo = value!;
              },
            ),
            const SizedBox(height: 16),
            // Campo para el Monto en ARS
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Monto (ARS)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "El monto es obligatorio";
                }
                if (double.tryParse(value) == null) {
                  return "Ingrese un monto válido";
                }
                return null;
              },
              onSaved: (value) {
                _monto = double.tryParse(value!);
              },
            ),
            const SizedBox(height: 16),
            // Campo para la Fecha
            TextFormField(
              controller: _fechaController,
              decoration: const InputDecoration(
                labelText: "Fecha",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () {
                _selectDate(context);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "La fecha es obligatoria";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Campo para la Descripción (opcional)
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Descripción (opcional)",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onSaved: (value) {
                _descripcion = value;
              },
            ),
            const SizedBox(height: 24),
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Guardar"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
            ],)
          ],
        ),
      ),
    );
  }
}