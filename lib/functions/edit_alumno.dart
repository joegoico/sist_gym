import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/alumno.dart';
import 'package:sistema_gym/objetos/precio.dart';
import 'package:sistema_gym/providers/disciplinas_provider.dart';
import 'package:provider/provider.dart';
import 'package:sistema_gym/objetos/disciplina.dart';

class FormEditAlumnos extends StatefulWidget {
  const FormEditAlumnos({super.key, required this.alumno});
  final Alumno alumno;

  @override
  State<FormEditAlumnos> createState() => _FormEditAlumnosState();
}

class _FormEditAlumnosState extends State<FormEditAlumnos> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _fechaController;

  @override
  void initState() {
    super.initState();
    // Puedes formatear la fecha como prefieras; aquí se muestra en formato dd/MM/yyyy.
    _fechaController = TextEditingController(
      text: "${widget.alumno.getFechaUltimoPago().day.toString().padLeft(2, '0')}/${widget.alumno.getFechaUltimoPago().month.toString().padLeft(2, '0')}/${widget.alumno.getFechaUltimoPago().year}"
    );
  }
    
  @override
  void dispose() {
    _fechaController.dispose();
    super.dispose();
  }
  Future<void> _selectDate() async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: widget.alumno.getFechaUltimoPago(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (newSelectedDate != null) {
      setState(() {
        widget.alumno.setFechaUltimoPago(newSelectedDate);
        // Actualiza el controlador con la nueva fecha formateada
        _fechaController.text =
            "${newSelectedDate.day.toString().padLeft(2, '0')}/${newSelectedDate.month.toString().padLeft(2, '0')}/${newSelectedDate.year}";
      });
    }
  }

  

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
              Text('Alumno editado con éxito', style: TextStyle(color: Colors.white)),
            ],
          ),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context, widget.alumno); // Cierra el modal después de guardar
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final DisciplinasProvider disciplinasProvider = Provider.of<DisciplinasProvider>(context);
    final List<Disciplina> disciplinas = disciplinasProvider.disciplinas;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Editar Alumno',
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: widget.alumno.getNombre(),
              decoration: const InputDecoration(
                labelText: 'Nombre del alumno',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, ingrese un nombre' : null,
              onSaved: (value) {
                widget.alumno.setNombre(value!);
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: widget.alumno.getApellido(),
              decoration: const InputDecoration(
                labelText: 'Apellido del alumno',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, ingrese un apellido' : null,
              onSaved: (value) {
                widget.alumno.setApellido(value!);
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: widget.alumno.getCorreoElectronico(),
              decoration: const InputDecoration(
                labelText: 'Correo electrónico del alumno',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, ingrese un correo electrónico' : null,
              onSaved: (value) {
                widget.alumno.setCorreoElectronico(value!);
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<Disciplina>(
              decoration: const InputDecoration(
                labelText: 'Disciplina',
                border: OutlineInputBorder(),
              ),
              value: widget.alumno.getDisciplina(),
              items: disciplinas.map((disciplina) {
                return DropdownMenuItem<Disciplina>(
                  value: disciplina,
                  child: Text(disciplina.getNombre()),
                );
              }).toList(),
              onChanged: (Disciplina? newValue) {
                setState(() {
                  widget.alumno.setDisciplina(newValue!);
                });
              },
            ),                   
            const SizedBox(height: 20),
            DropdownButtonFormField<Precio>(
              decoration: const InputDecoration(
                labelText: 'Cuota',
                border: OutlineInputBorder(),
              ),
              value: widget.alumno.getCuota(),
              items: widget.alumno.getDisciplina().getPrecios().map((precio){
                return DropdownMenuItem<Precio>(
                  value: precio,
                  child: Text(
                      '${precio.getPrecio().toStringAsFixed(2)} ARS - ${precio.getCantDias()} días'));
              }).toList(), 
              onChanged: (Precio? newValue){
                setState(() {
                  widget.alumno.setCuota(newValue!);
                });
              }),
            const SizedBox(height: 16),
            TextFormField(
              controller: _fechaController,
              decoration: const InputDecoration(
                labelText: 'Fecha del último pago',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Esto evita que el usuario escriba manualmente
              onTap: _selectDate, // Función que usará el date picker
              validator: (value) =>
                value == null || value.isEmpty ? 'Por favor, ingrese una fecha' : null,
              // No necesitas onSaved aquí, ya que actualizas directamente en el objeto.
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Switch(
                  value: widget.alumno.getDescuento(),
                  onChanged: (bool? value) {
                    setState(() {
                      widget.alumno.setDescuento(value!);
                    });
                  },
                ),
                const Text('Aplicar Descuento'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes manejar la lógica para editar el gasto
                    _submitForm();
                  },
                  child: const Text('Guardar Cambios'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra el modal sin guardar cambios
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            )
            ,
          ],
        ),
      ),
    ) ;
  }
}

