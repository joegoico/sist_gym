import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_gym/functions/form_agregar_disciplina.dart';
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/functions/form_edit_disciplina.dart';
import 'package:sistema_gym/providers/disciplinas_provider.dart';
import 'package:go_router/go_router.dart';

class DiscplinasPage extends StatefulWidget {
  const DiscplinasPage({super.key, required this.title});
  final String title;

  @override
  State<DiscplinasPage> createState() => _DiscplinasPageState();
}

class _DiscplinasPageState extends State<DiscplinasPage> {
  // Lista que almacena todos los alumnos creados

  // Muestra el formulario y espera que retorne los datos del alumno nuevo
  Future<void> _showNuevaDisciplinaForm(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        // Se espera que NuevoAlumnoForm retorne un objeto Alumno al cerrar
        return const NuevaDisciplinaForm();
      },
    );

    // Si el formulario retorna un alumno, se agrega a la lista y se actualiza la UI
    if (result != null && result is Disciplina) {
      setState(() {
        Provider.of<DisciplinasProvider>(context, listen: false).agregarDisciplina(result);
      });
    }
  }

  Future<void> _showEditDisciplinaForm(BuildContext context, Disciplina disciplina) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        // Se espera que NuevoAlumnoForm retorne un objeto Alumno al cerrar
        return FormEditDisciplina(disciplina: disciplina);
      },
    );

    // Si el formulario retorna un alumno, se agrega a la lista y se actualiza la UI
    if (result != null && result is Disciplina) {
      setState(() {
        Provider.of<DisciplinasProvider>(context, listen: false).editarDisciplina(disciplina,result);
      });
    }
  }

  Future<bool?> showDeleteDisciplinaDialog(BuildContext context, Disciplina disciplina) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content: Text(
            '¿Estás seguro de eliminar la disciplina "${disciplina.getNombre()}"?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final disciplinasProvider = Provider.of<DisciplinasProvider>(context).disciplinas; // Obtiene la lista de disciplinas del provider
    return Stack(
      children: [
        // Si no hay alumnos, se muestra un mensaje. Caso contrario, se muestra un ListView de Cards.
        disciplinasProvider.isEmpty
          ? const Center(
              child: Text(
                "No hay disciplinas agregadas",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: disciplinasProvider.length,
              itemBuilder: (context, index) {
                final disciplina = disciplinasProvider[index];
                return Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(disciplina.getNombre()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async{
                              final confirmacion = await showDeleteDisciplinaDialog(context, disciplina);
                              if (confirmacion!){
                                Provider.of<DisciplinasProvider>(context, listen: false).eliminarDisciplina(disciplina);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.green),
                                    SizedBox(width: 8),
                                    Text('Disciplina eliminada con éxito'),
                                  ],
                                  ) 
                                ),
                              );
                              } // Si no se confirma la eliminación, no se hace nada
                              // Elimina la disciplina de la lista
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _showEditDisciplinaForm(context, disciplina);
                            },
                          ),
                          IconButton(icon: const Icon(Icons.monetization_on),
                            onPressed: (){
                              context.go('/precios', extra: disciplina);//dirige a la lista de precios para esa disciplina
                            },)
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: RawMaterialButton(
                onPressed: () {
                  _showNuevaDisciplinaForm(context);
                },
                elevation: 2.0,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
                child:  Icon(
                  Icons.add,
                  size: 25.0,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
      ],
    );
  }
}