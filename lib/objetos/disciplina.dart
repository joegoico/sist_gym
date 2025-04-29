import 'package:sistema_gym/objetos/precio.dart';

class Disciplina {
  int id;
  String nombre;
  List<Precio> precios;

  Disciplina({
    required this.id,
    required this.nombre,
    List<Precio>? precios, // Parámetro opcional y nullable
  }) : precios = precios ?? []; // Si no se pasa un valor, se asigna una lista mutable nueva
  void setNombre(String nombre) {
    this.nombre = nombre;
  }
  void agregarPrecio(Precio precio) {
    precios.add(precio);
  }
  void eliminarPrecio(Precio precio) {
    precios.remove(precio);
  }
  String getNombre() {
    return nombre;
  }
  List<Precio> getPrecios() {
    return precios;
  }
  Precio getPrecio(int index) {
    return precios[index];
  }
  int getId() {
    return id;
  }
  void setId(int id) {
    this.id = id;
  }
}
