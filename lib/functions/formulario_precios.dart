import 'package:flutter/material.dart';

class NuevoPagoForm extends StatefulWidget {
  const NuevoPagoForm({Key? key}) : super(key: key);

  @override
  _NuevoPagoFormState createState() => _NuevoPagoFormState();
}

class _NuevoPagoFormState extends State<NuevoPagoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables del formulario
  String? _selectedCategory;
  String? _newCategory;
  int? _selectedDays;
  double? _monto;

  // Lista de categorías (incluye la opción para crear nueva)
  final List<String> _categories = [
    'Transporte',
    'Comida',
    'Entretenimiento',
    'Servicios',
    'Crear nueva categoría'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Selección de categoría
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Categoría',
                border: OutlineInputBorder(),
              ),
              items: _categories.map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                  // Si se selecciona cualquier opción diferente a "Crear nueva categoría",
                  // se limpia la variable de la nueva categoría.
                  if (newValue != 'Crear nueva categoría') {
                    _newCategory = null;
                  }
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Seleccione una categoría';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Si se elige la opción "Crear nueva categoría", se muestra un campo para ingresar el nombre
            if (_selectedCategory == 'Crear nueva categoría')
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nueva Categoría',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _newCategory = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la nueva categoría';
                  }
                  return null;
                },
              ),
            if (_selectedCategory == 'Crear nueva categoría')
              const SizedBox(height: 16),
            // Selección de cantidad de días (desplegable del 1 al 5)
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
            ),
            const SizedBox(height: 16),
            // Campo para ingresar el monto a cobrar (en pesos argentinos)
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Monto (ARS)',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSaved: (value) {
                _monto = double.tryParse(value ?? '');
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el monto';
                }
                if (double.tryParse(value) == null) {
                  return 'Ingrese un monto válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            // Botón para guardar los datos
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Guarda los valores ingresados en los campos
                      _formKey.currentState!.save();

                      // Si la opción "Crear nueva categoría" fue seleccionada, se usa _newCategory;
                      // de lo contrario, se utiliza nativamente la categoría seleccionada.
                      final String? finalCategory =
                          _selectedCategory == 'Crear nueva categoría'
                              ? _newCategory
                              : _selectedCategory;

                      // Aquí se pueden utilizar los datos recogidos (en este ejemplo, se muestra mediante un SnackBar)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle, color: Colors.white),
                              SizedBox(width: 10),
                              Text('Nuevo precio registrado con éxito', style: TextStyle(color: Colors.white)),
                            ],
                         ),
                          duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context); // Cierra el modal después de guardar
                  // Aquí podrías limpiar el formulario, enviar los datos a un servidor, etc.
                }
              },
              child: const Text('Guardar'),
            ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra el formulario
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}