// modelo_alumnos.dart
import 'package:flutter/foundation.dart';
import 'package:sistema_gym/objetos/gasto.dart'; // Tu modelo Alumno

class GastosProvider extends ChangeNotifier {
  final List<Gasto> _gastos = [];

  List<Gasto> get gastos => List.unmodifiable(_gastos);

  void agregarGasto(Gasto nuevoGasto) {
    _gastos.add(nuevoGasto);
    notifyListeners();
  }

  void eliminarGasto(Gasto gasto) {
    _gastos.remove(gasto);
    notifyListeners();
  }

  void editarGasto(Gasto gasto, Gasto nuevoGasto) {
    final index = _gastos.indexOf(gasto);
    if (index != -1) {
      _gastos[index] = nuevoGasto;
      notifyListeners();
    }
  }

  // Agrega otros métodos, como eliminar o editar, si los necesitas
}