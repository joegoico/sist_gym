import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sistema_gym/objetos/alumno.dart';
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:provider/provider.dart';
import 'package:sistema_gym/providers/disciplinas_provider.dart';
import 'package:sistema_gym/objetos/precio.dart';

class NuevoAlumnoForm extends StatefulWidget {
  const NuevoAlumnoForm({super.key});

  @override
  _NuevoAlumnoFormState createState() => _NuevoAlumnoFormState();
}

class _NuevoAlumnoFormState extends State<NuevoAlumnoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  bool applyDiscount = false;
  DateTime? selectedDate;

  String _nombre="";
  String _apellido="";
  String _correoElectronico="";
  Disciplina? _disciplinaSeleccionada;
  Precio? _precioSeleccionado;


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
    final DisciplinasProvider disciplinasProvider = Provider.of<DisciplinasProvider>(context);
    final List<Disciplina> disciplinas = disciplinasProvider.disciplinas;
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
                    DropdownButtonFormField<Disciplina>(
                      decoration: const InputDecoration(
                        labelText: 'Disciplina',
                        border: OutlineInputBorder(),
                      ),
                      value: _disciplinaSeleccionada,
                      items: disciplinas.map((disciplina) {
                        return DropdownMenuItem<Disciplina>(
                          value: disciplina,
                          child: Text(disciplina.getNombre()),
                        );
                      }).toList(),
                      onChanged: (Disciplina? newValue) {
                        setState(() {
                          _disciplinaSeleccionada = newValue;
                          _precioSeleccionado = null;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'La disciplina es obligatoria';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _disciplinaSeleccionada = value;
                      },
                    ),                    
                    const SizedBox(height: 10),
                    _disciplinaSeleccionada != null ?
                      _disciplinaSeleccionada!.getPrecios().isNotEmpty ?
                        DropdownButtonFormField<Precio>(
                          decoration: const InputDecoration(
                            labelText: "Cuota",
                            border: OutlineInputBorder(),
                          ),
                          value: _precioSeleccionado,
                          items: _disciplinaSeleccionada!.getPrecios().map((precio) {
                          return DropdownMenuItem<Precio>(
                            value: precio,
                            child: Text(
                                '${precio.getPrecio().toStringAsFixed(2)} ARS - ${precio.getCantDias()} días'),
                          );
                        }).toList(), 
                          onChanged: (Precio? newPrecio){
                            setState(() {
                              _precioSeleccionado=newPrecio;
                            });
                          },
                          validator: (value) => 
                            value == null? 'Seleccione la cuota del alumno': null,
                          onSaved: (value){
                            _precioSeleccionado = value;
                          },
                          )
                        : Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'La disciplina seleccionada no tiene precios asignados',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'Seleccione una disciplina para ver precios asociados',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                const SizedBox(height: 24),
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
                                  disciplina: _disciplinaSeleccionada!,
                                  cuota: _precioSeleccionado!,
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