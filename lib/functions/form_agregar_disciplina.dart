import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/disciplina.dart';

class NuevaDisciplinaForm extends StatefulWidget {
  const NuevaDisciplinaForm({Key? key}) : super(key: key);

  @override
  _NuevaDisciplinaFormState createState() => _NuevaDisciplinaFormState();
}
class _NuevaDisciplinaFormState extends State<NuevaDisciplinaForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables del formulario
  String? _nombreDisciplina;
  
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí procesas los datos, por ejemplo:
      if (_nombreDisciplina != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const  SnackBar(
            backgroundColor: Colors.green,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 10),
                Text('Disciplina registrada con éxito', style: TextStyle(color: Colors.white)),
              ],
            ),
            duration: Duration(seconds: 2),
          ),
        );
        final Disciplina nuevaDisciplina = Disciplina(
          nombre: _nombreDisciplina!,
          id: 1,
        );
        Navigator.pop(context,nuevaDisciplina); // Cierra el modal después de guardar
      }
      // Aquí puedes limpiar el formulario o navegar hacia atrás
    } else {
      print("no hay nombre");
      if (_nombreDisciplina == null) {
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
            Text( 'Agregar Disciplina'),
            const SizedBox(height: 16),
            // Campo para el nombre de la disciplina
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre de la Disciplina',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa el nombre de la disciplina';
                }
                return null;
              },            
              onSaved: (value) {
                print("nombre de la disciplina en  form: $_nombreDisciplina");
                _nombreDisciplina = value!;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Guardar'),
                ),
                ElevatedButton(
                  onPressed:(){
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}