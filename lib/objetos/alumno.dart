
import 'package:sistema_gym/objetos/disciplina.dart';
import 'package:sistema_gym/objetos/pago.dart';
class Alumno {
  int _id;
  String _nombre;
  String _apellido;
  String _correoElectronico;
  Disciplina _disciplina;
  List<Pago> _pagosRealizados = [];

  Alumno({
    required int id,
    required String nombre,
    required String apellido,
    required String correoElectronico,
    required Disciplina disciplina,
  })  : _id = id,
        _nombre = nombre,
        _apellido = apellido,
        _correoElectronico = correoElectronico,
        _disciplina = disciplina;
  void setId(int id) {
    _id = id;
  }
  void setDisciplina(Disciplina disciplina) {
    _disciplina = disciplina;
  }        
  void setNombre(String nombre) {
    _nombre = nombre;
  }
  void setApellido(String apellido) {
    _apellido = apellido;
  }
  void setCorreoElectronico(String correoElectronico) {
    _correoElectronico = correoElectronico;
  }

  void agregarFechaDePago(Pago fechaDePago) {
    insertPagoOrdered(_pagosRealizados, fechaDePago);
  }

  void eliminarFechaDePago(Pago fechaDePago) {
    _pagosRealizados.remove(fechaDePago);
  }

  String getNombre() {
    return _nombre;
  }
  String getApellido() {
    return _apellido;
  }
  String getCorreoElectronico() {
    return _correoElectronico;
  }

  List<Pago> getPagosRealizados() {
    return _pagosRealizados;
  }
  int getId() {
    return _id;
  }
  Disciplina getDisciplina() {
    return _disciplina;
  }

  void insertPagoOrdered(List<Pago> pagos, Pago newPago) {
  // Si la lista está vacía, simplemente agrega el nuevo pago.
    if (pagos.isEmpty) {
      pagos.add(newPago);
      return;
    }
    
    // Encuentra el índice en que el nuevo pago debe insertarse.
    // Compara las fechas y si newPago es anterior a un pago existente, se inserta justo antes.
    int indexToInsert = pagos.indexWhere((pago) => newPago.getFechaDePago().isBefore(pago.getFechaDePago()));
    
    if (indexToInsert == -1) {
      // Si no se encontró ningún elemento cuyo pago sea posterior a newPago, se agrega al final.
      pagos.add(newPago);
    } else {
      pagos.insert(indexToInsert, newPago);
    }
  }
}