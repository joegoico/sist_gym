import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/disciplina.dart';

class FormEditDisciplina extends StatefulWidget {
  const FormEditDisciplina({Key? key, required this.disciplina}) : super(key: key);

  final Disciplina disciplina;

  @override
  _FormEditDisciplinaState createState() => _FormEditDisciplinaState();
}
class _FormEditDisciplinaState extends State<FormEditDisciplina>{
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
              Text('Disciplina editada con éxito', style: TextStyle(color: Colors.white)),
            ],
          ),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context, widget.disciplina); // Cierra el modal después de guardar
    } else {
      print("no hay nombre");
      if (widget.disciplina.nombre.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Por favor, escriba un nombre para la disciplina")),
        );
      }
    }
  }

   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Campo para el nombre de la disciplina
            TextFormField(
              initialValue: widget.disciplina.nombre,
              decoration: const InputDecoration(labelText: 'Nombre de la disciplina'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, ingrese un nombre' : null,
              onSaved: (value) {
                widget.disciplina.nombre = value!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes guardar los cambios o hacer lo que necesites
                _submitForm(); // Cierra el modal después de guardar
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}