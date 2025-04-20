import 'package:flutter/material.dart';
import 'package:sistema_gym/functions/formulario_gastos.dart';
import 'package:sistema_gym/objetos/gasto.dart';
class Gastos extends StatefulWidget {
  const Gastos({super.key});

  @override
  State<Gastos> createState() => _GastosState();
}
class _GastosState extends State<Gastos> {
  final List<Gasto> _gastos = []; // Lista para almacenar los gastos

  void _showNuevoGastoForm(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const AgregarGastoForm();
      },
    );
    if (result != null && result is Gasto) {
      setState(() {
        _gastos.add(result); // Agrega el nuevo gasto a la lista
      });
    }
  }
  @override
  Widget build(BuildContext context) {
  return Stack(
    children: [
      // El contenido principal.
      _gastos.isEmpty
        ? const Center(
            child: Text(
              "No hay gastos agregados",
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: _gastos.length,
            itemBuilder: (context, index) {
              final gasto = _gastos[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  children: [
                    // Aquí se muestran los datos del alumno
                    ListTile(
                      title: Text('${gasto.titulo} '),
                      subtitle: Text('${gasto.monto} ARS'),
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
                              _gastos.removeAt(index);
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
      Positioned(
        right: 20,
        bottom: 20,
        child: 
          RawMaterialButton(
            onPressed: () {
              _showNuevoGastoForm(context);// Acción al presionar.
            },
            elevation: 2.0,
            fillColor: Colors.blue,
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
            child: Icon(
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