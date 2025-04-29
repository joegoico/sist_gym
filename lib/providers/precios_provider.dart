// modelo_alumnos.dart
import 'package:flutter/foundation.dart';
import 'package:sistema_gym/objetos/precio.dart'; // Tu modelo Alumno

class PreciosProvider extends ChangeNotifier {
  final List<Precio> _precios = [];

  List<Precio> get precios => List.unmodifiable(_precios);

  void agregarPrecio(Precio nuevoPrecio) {
    _precios.add(nuevoPrecio);
    notifyListeners();
  }

  void eliminarPrecio(Precio precio) {
    _precios.remove(precio);
    notifyListeners();
  }
  void editarPrecio(Precio precio, Precio nuevoPrecio ) {
    int index = _precios.indexOf(precio);
    if (index != -1) {
      _precios[index] = nuevoPrecio;

      notifyListeners();
    }
  }
  // Agrega otros métodos, como eliminar o editar, si los necesitas
}