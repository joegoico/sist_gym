import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NuevoAlumnoForm extends StatefulWidget {
  const NuevoAlumnoForm({Key? key}) : super(key: key);

  @override
  _NuevoAlumnoFormState createState() => _NuevoAlumnoFormState();
}

class _NuevoAlumnoFormState extends State<NuevoAlumnoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool applyDiscount = false;
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Formato de la fecha
    final String fechaDisplay = selectedDate == null
        ? 'Seleccionar fecha de pago'
        : 'Fecha: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}';
        
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Hace que el modal se ajuste al contenido
          children: [
            const Text(
              'Nuevo Alumno',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El nombre es obligatorio';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Apellido',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El apellido es obligatorio';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El correo electrónico es obligatorio';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Ingrese un correo válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(fechaDisplay),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  tooltip: 'Seleccionar fecha',
                  onPressed: _pickDate,
                ),
              ],
            ),
            if (selectedDate == null)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'La fecha es obligatoria',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 10),
            Row(
              children: [
                Switch(value: applyDiscount, 
                  onChanged: (bool? value) {
                    setState(() {
                      applyDiscount = value ?? false;
                    });
                  },
                ),
                const Text('Aplicar Descuento'),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && selectedDate != null) {
                      // Aquí puedes ejecutar la acción de guardar, como enviar datos a la API o actualizarlos en el estado de la app
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle, color: Colors.white),
                              SizedBox(width: 10),
                              Text('Alumno guardado con éxito', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context); // Cierra el modal
                    } else if (selectedDate == null) {
                      setState(() {}); // Para actualizar el mensaje de error de la fecha
                    }
                  },
                  child: const Text('Guardar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}