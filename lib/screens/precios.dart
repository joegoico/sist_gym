import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_gym/functions/formulario_precios.dart';
import 'package:sistema_gym/providers/precios_provider.dart';
import 'package:sistema_gym/objetos/precio.dart';
class Precios extends StatefulWidget {
  const Precios({super.key});

  @override
  State<Precios> createState() => _PreciosState();
}
class _PreciosState extends State<Precios>  {

  void _showNuevoPrecioForm(BuildContext context) async{
    //guarda el resultado del formulario en la variable result
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const NuevoPagoForm();
      },
    );
    if (result != null && result is Precio) {
      setState(() {
        Provider.of<PreciosProvider>(context, listen: false).agregarPrecio(result); // Agrega el nuevo gasto a la lista
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final preciosProvider = Provider.of<PreciosProvider>(context).precios;
    return Stack(
      children: [
        preciosProvider.isEmpty
          ? const Center(
              child: Text(
                "No hay precios agregados",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: preciosProvider.length,
              itemBuilder: (context, index) {
                final precio = preciosProvider[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      // Aquí se muestran los datos del precio
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
                              // Acción al presionar el botón de editar
                               // Muestra el formulario para editar el precio
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Elimina el precio de la lista
                              Provider.of<PreciosProvider>(context, listen: false).eliminarPrecio(precio);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
        // El contenido principal.
        // Posiciona el botón en la esquina inferior derecha.
        Positioned(
          right: 20,
          bottom: 20,
          child: RawMaterialButton(
            onPressed: () {
              _showNuevoPrecioForm(context );// Acción al presionar el botón
            },
            elevation: 2.0,
            fillColor: const Color.fromARGB(255, 146, 181, 209),
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