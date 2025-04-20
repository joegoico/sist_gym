import 'package:flutter/material.dart';
import 'package:sistema_gym/functions/formulario_alumnos.dart';
import 'package:sistema_gym/objetos/alumno.dart';
// Modelo para el alumno.

class Alumnos extends StatefulWidget {
  const Alumnos({super.key, required this.title});
  final String title;

  @override
  State<Alumnos> createState() => _AlumnosState();
}

class _AlumnosState extends State<Alumnos> {
  // Lista que almacena todos los alumnos creados
  final List<Alumno> _alumnos = [];

  // Muestra el formulario y espera que retorne los datos del alumno nuevo
  Future<void> _showNuevoAlumnoForm(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        // Se espera que NuevoAlumnoForm retorne un objeto Alumno al cerrar
        return const NuevoAlumnoForm();
      },
    );

    // Si el formulario retorna un alumno, se agrega a la lista y se actualiza la UI
    if (result != null && result is Alumno) {
      setState(() {
        _alumnos.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Si no hay alumnos, se muestra un mensaje. Caso contrario, se muestra un ListView de Cards.
        _alumnos.isEmpty
            ? const Center(
                child: Text(
                  "No hay alumnos agregados",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _alumnos.length,
                itemBuilder: (context, index) {
                  final alumno = _alumnos[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        // Aquí se muestran los datos del alumno
                        ListTile(
                          title: Text('${alumno.nombre} '),
                          subtitle: Text('${alumno.apellido}'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Aquí puedes agregar la lógica para editar el alumno
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                // Aquí puedes agregar la lógica para eliminar el alumno
                                setState(() {
                                  _alumnos.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        )// Aquí se pueden agregar más widgets o información del alumno
                      ],
                    ),
                  );
                },
              ),
        // Botón flotante para abrir el formulario y agregar un nuevo alumno
        Positioned(
          right: 20,
          bottom: 20,
          child: RawMaterialButton(
            onPressed: () {
              _showNuevoAlumnoForm(context);
            },
            elevation: 2.0,
            fillColor: const Color.fromARGB(255, 146, 181, 209),
            padding: const EdgeInsets.all(15.0),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              size: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}