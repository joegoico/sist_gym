import 'package:sistema_gym/objetos/precio.dart';

class Disciplina {
  int _id;
  String _nombre;
  List<Precio> _precios;

  Disciplina({
    required int id,
    required String nombre,
    List<Precio>? precios, // Parámetro opcional y nullable
  }) :_id = id,
       _nombre = nombre,
       _precios = precios ?? []; // Si no se pasa un valor, se asigna una lista mutable nueva 
   // Si no se pasa un valor, se asigna una lista mutable nueva
  void setNombre(String nombre) {
    _nombre = nombre;
  }
  void agregarPrecio(Precio precio) {
    _precios.add(precio);
  }
  void eliminarPrecio(Precio precio) {
    _precios.remove(precio);
  }
  String getNombre() {
    return _nombre;
  }
  List<Precio> getPrecios() {
    return _precios;
  }
  Precio getPrecio(int index) {
    return _precios[index];
  }
  int getId() {
    return _id;
  }
  void setId(int id) {
    _id = id;
  }

  void updatePrecio(int index, Precio precio) {
    _precios[index] = precio;
  }
}
