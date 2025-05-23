import 'package:sistema_gym/objetos/alumno.dart';
import 'package:sistema_gym/objetos/disciplina.dart';
class Deudor extends Alumno{
  List<String> mesesAdeudados ;
  double montoAdeudado;
  int cantDiasAdeudados;

  Deudor({
    this.mesesAdeudados = const [],
    required this.montoAdeudado,
    required this.cantDiasAdeudados,
    required int id,
    required String nombre,
    required String apellido,
    required String correoElectronico,
    required Disciplina disciplina,
  }): super(id: id, nombre: nombre, apellido: apellido, correoElectronico: correoElectronico, disciplina: disciplina);

  List<String> get getMesesAdeudados => mesesAdeudados;
  double get getMontoAdeudado => montoAdeudado;
  int get getCantDiasAdeudados => cantDiasAdeudados;

  set setMesesAdeudados(List<String> mesesAdeudados) {
    this.mesesAdeudados.clear();
    this.mesesAdeudados.addAll(mesesAdeudados);
  }

  void setMontoAdeudado(double montoAdeudado) {
    this.montoAdeudado = montoAdeudado;
  }

  void setCantDiasAdeudados(int cantDiasAdeudados) {
    this.cantDiasAdeudados = cantDiasAdeudados;
  }
  void agregarMes (String mes){
    mesesAdeudados.add(mes);
  }

  void eliminarMes (String mes, double monto){
    mesesAdeudados.remove(mes);
    actualizarMontoAdeudado(monto);
  }

  //Cuando se elimina un mes se le solicita el usuario que ingrerse manualmente el
  //monto adeudado para ese mes
  void actualizarMontoAdeudado (double monto){
    montoAdeudado -= monto;
  }
}