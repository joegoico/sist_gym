import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sistema_gym/objetos/alumno.dart';

class NuevoAlumnoForm extends StatefulWidget {
  const NuevoAlumnoForm({Key? key}) : super(key: key);

  @override
  _NuevoAlumnoFormState createState() => _NuevoAlumnoFormState();
}

class _NuevoAlumnoFormState extends State<NuevoAlumnoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool applyDiscount = false;
  DateTime? selectedDate;
  int? _selectedDays; // Valor por defecto para la cantidad de días

  String _nombre="";
  String _apellido="";
  String _correoElectronico="";
  int _candidadDias=0;


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
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Se ajusta al contenido, pero se podrá desplazar
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
                      onSaved: (value) {
                        _nombre = value?.trim() ?? '';
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
                      onSaved: (value) {
                        _apellido = value?.trim() ?? '';
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
                      onSaved: (value) {
                        _correoElectronico = value?.trim() ?? '';
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<int>(
                      decoration: const InputDecoration(
                        labelText: 'Cantidad de Días',
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(5, (index) => index + 1)
                          .map((day) => DropdownMenuItem<int>(
                                value: day,
                                child: Text(day.toString()),
                              ))
                          .toList(),
                      value: _selectedDays,
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedDays = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Seleccione la cantidad de días';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _candidadDias = value!;
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
                        Switch(
                          value: applyDiscount,
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
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() && selectedDate != null) {
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
                                _formKey.currentState!.save(); // Guarda los datos del formulario
                                final Alumno nuevoAlumno = Alumno(
                                  id: 1,
                                  nombre: _nombre,
                                  apellido: _apellido,
                                  correoElectronico: _correoElectronico,
                                  fechaUltimoPago: selectedDate!,
                                  descuento: applyDiscount, // Cambia el monto según la lógica de descuento
                                );                    
                                Navigator.pop(context, nuevoAlumno); // Cierra el modal
                              } else if (selectedDate == null) {
                                setState(() {});
                              }
                            },
                            child: const Text('Guardar'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}