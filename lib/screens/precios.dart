import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/objetos/precio.dart';
import 'package:sistema_gym/functions/formulario_precios.dart'; // Formulario para agregar/editar precios

class PreciosPage extends StatefulWidget {
  final Disciplina disciplina;
  const PreciosPage({Key? key, required this.disciplina}) : super(key: key);

  @override
  State<PreciosPage> createState() => _PreciosPageState();
}

class _PreciosPageState extends State<PreciosPage> {
  // Método para mostrar el formulario de un nuevo precio:
  void _showNuevoPrecioForm(BuildContext context) async {
    final nuevoPrecio = await showModalBottomSheet<Precio>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const NuevoPrecioForm();  // Se espera que retorne un objeto Precio
      },
    );
    if (nuevoPrecio != null) {
      setState(() {
        widget.disciplina.agregarPrecio(nuevoPrecio);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Utilizar la lista interna de la disciplina para mostrar los precios.
    final precios = widget.disciplina.getPrecios();

    return Stack(
      children: [

      precios.isEmpty
          ? const Center(
              child: Text(
                "No hay precios agregados",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: precios.length,
              itemBuilder: (context, index) {
                final precio = precios[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('${precio.cantDias} días'),
                        subtitle: Text('${precio.precio} ARS'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Aquí podrías llamar a un formulario para editar el precio.
                              // Luego, usando setState, actualizar el precio modificado en la lista.
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                widget.disciplina.eliminarPrecio(precio);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      Positioned(
        bottom: 20,
        right: 20,
        child: FloatingActionButton(
          onPressed: () => _showNuevoPrecioForm(context),
          child: const Icon(Icons.add),
        ),
      ),
      ],
    );
  }
}