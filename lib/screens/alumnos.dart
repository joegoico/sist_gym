import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_gym/functions/formulario_alumnos.dart';
import 'package:sistema_gym/objetos/alumno.dart';
import 'package:sistema_gym/objetos/pago.dart';
import 'package:sistema_gym/providers/alumnos_provider.dart';
import 'package:sistema_gym/functions/edit_alumno.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_gym/functions/form_new_payment.dart';

class Alumnos extends StatefulWidget {
  const Alumnos({super.key, required this.title});
  final String title;

  @override
  State<Alumnos> createState() => _AlumnosState();
}

class _AlumnosState extends State<Alumnos>   {
  // Lista que almacena todos los alumnos creados

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
        Provider.of<AlumnosModel>(context, listen: false).agregarAlumno(result);
      });
    }
  }

  Future<void> _showEditAlumnoForm(BuildContext context, Alumno alumno) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        // Se espera que NuevoAlumnoForm retorne un objeto Alumno al cerrar
        return FormEditAlumnos(alumno: alumno);
      },
    );

    // Si el formulario retorna un alumno, se agrega a la lista y se actualiza la UI
    if (result != null && result is Alumno) {
      setState(() {
        Provider.of<AlumnosModel>(context, listen: false).editarAlumno(alumno, result);
      });
    }
  }

  Future<void> _showRegistrarPagoForm(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        // Se espera que NuevoAlumnoForm retorne un objeto Alumno al cerrar
        return  FormNewPayment();
      },
    );
    if (result != null && result is Pago) {
      setState(() {
      });
    }
  }

Future<bool?> showDeleteAlumnoDialog(BuildContext context, Alumno alumno) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmar Eliminación'),
        content: Text(
          '¿Estás seguro de eliminar al alumno "${alumno.getNombre()} ${alumno.getApellido()}"? Esta acción borrará todos sus datos asociados.',
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
  Widget build(BuildContext context) {// Llama al método build de la clase padre
    final alumnosProvider = Provider.of<AlumnosModel>(context).alumnos; // Obtiene la lista de alumnos del provider
    return Stack(
      children: [
        // Si no hay alumnos, se muestra un mensaje. Caso contrario, se muestra un ListView de Cards.
        alumnosProvider.isEmpty
            ? const Center(
                child: Text(
                  "No hay alumnos agregados",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: alumnosProvider.length,
                itemBuilder: (context, index) {
                  final alumno = alumnosProvider[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        // Aquí se muestran los datos del alumno
                        ListTile(
                          title: Text('${alumno.getNombre()} '),
                          subtitle: Text(alumno.getApellido()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: (){
                                context.go('/pagos', extra: alumno);
                              }, 
                              icon: const Icon(Icons.calendar_month_rounded),),
                            IconButton(
                              onPressed: () {
                                _showEditAlumnoForm(context, alumno);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                                onPressed: () async {
                                  bool? confirmado = await showDeleteAlumnoDialog(context, alumno);
                                  if (confirmado == true) {
                                    if (!mounted) return;
                                    Provider.of<AlumnosModel>(context, listen: false).eliminarAlumno(alumno);
                                    if (!mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content:Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check_circle, color: Colors.green),
                                          SizedBox(width: 8),
                                          Text('Alumno eliminado con éxito'),
                                        ],
                                      ) ),
                                    );
                                  }
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
          child: PopupMenuButton<String>(
            surfaceTintColor: Colors.yellow,
            // Definimos el ícono o botón que se mostrará
            icon: const Icon(
              Icons.add,
              size: 25.0,
              color: Colors.white,
            ),
            // Opciones del menú: cada valor es una cadena identificativa
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'nuevoAlumno',
                child: Row(
                  children: const [
                    Icon(Icons.person_add, color: Colors.black),
                    SizedBox(width: 8),
                    Text("Agregar Alumno"),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'registrarPago',
                child: Row(
                  children: const [
                    Icon(Icons.payment, color: Colors.black),
                    SizedBox(width: 8),
                    Text("Registrar Pago"),
                  ],
                ),
              ),
            ],
            // Al seleccionar una opción se ejecuta este callback
            onSelected: (String selectedValue) {
              if (selectedValue == 'nuevoAlumno') {
                _showNuevoAlumnoForm(context);
              } else if (selectedValue == 'registrarPago') {
                _showRegistrarPagoForm(context);
              }
            },
          ),
        ),
      ],
    );
  } // Mantiene el estado de la pestaña
}