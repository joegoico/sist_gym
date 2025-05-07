import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/precio.dart';
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/functions/formulario_precios.dart';
class PreciosPage extends StatefulWidget {
  final Disciplina disciplina;
  const PreciosPage({super.key, required this.disciplina});

  @override
  State<PreciosPage> createState() => _PreciosPageState();
}

class _PreciosPageState extends State<PreciosPage> {
  void _showNuevoPrecioForm(BuildContext context) async {
    final nuevoPrecio = await showModalBottomSheet<Precio>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const NuevoPrecioForm();
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
    final precios = widget.disciplina.getPrecios();

    return Scaffold(
      backgroundColor: DefaultSelectionStyle.defaultColor,
      body: 
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
                        title: Text('${precio.getCantDias()} días'),
                        subtitle: Text('${precio.getPrecio()} ARS'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Aquí podrías llamar al formulario para editar el precio.
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNuevoPrecioForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}