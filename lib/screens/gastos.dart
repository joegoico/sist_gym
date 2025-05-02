import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_gym/functions/formulario_gastos.dart';
import 'package:sistema_gym/objetos/gasto.dart';
import 'package:sistema_gym/providers/gastos_provider.dart';
import 'package:sistema_gym/functions/form_edit_gastos.dart';
class Gastos extends StatefulWidget {
  const Gastos({super.key});

  @override
  State<Gastos> createState() => _GastosState();
}
class _GastosState extends State<Gastos>   {

  void _showEditGastoForm(BuildContext context, Gasto gasto) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return FormEditGastos(gasto: gasto);
      },
    );
    if (result != null && result is Gasto) {
      setState(() {
        Provider.of<GastosProvider>(context,listen: false,).editarGasto(gasto,result); // Agrega el nuevo gasto a la lista
      });
    }
  }
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
        Provider.of<GastosProvider>(context,listen: false,).agregarGasto(result); // Agrega el nuevo gasto a la lista
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // Obtiene la lista de gastos del provider
    final gastosProvider = Provider.of<GastosProvider>(context).gastos;
    // Mantiene el estado de la pantalla al cambiar de pestaña
  return Stack(
    children: [
      // El contenido principal.
      gastosProvider.isEmpty
        ? const Center(
            child: Text(
              "No hay gastos agregados",
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: gastosProvider.length,
            itemBuilder: (context, index) {
              final gasto = gastosProvider[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  children: [
                    // Aquí se muestran los datos del alumno
                    ListTile(
                      title: Text('${gasto.getTitulo()} '),
                      subtitle: Text('${gasto.getMonto()} ARS'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showEditGastoForm(context, gasto);
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            // Aquí puedes agregar la lógica para eliminar el alumno
                            setState(() {
                              Provider.of<GastosProvider>(context, listen: false).eliminarGasto(gasto);
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
  } // Mantiene el estado de la pantalla al cambiar de pestaña
}