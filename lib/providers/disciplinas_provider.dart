// modelo_alumnos.dart
import 'package:flutter/foundation.dart';
import 'package:sistema_gym/objetos/disciplina.dart'; // Tu modelo Alumno
import 'package:sistema_gym/objetos/precio.dart';

class DisciplinasProvider extends ChangeNotifier {
  final List<Disciplina> disciplina = [];

  List<Disciplina> get disciplinas => List.unmodifiable(disciplina);

  void agregarDisciplina(Disciplina nuevaDisciplina) {
    disciplina.add(nuevaDisciplina);
    notifyListeners();
  }

  void eliminarDisciplina(Disciplina disci) {
    disciplina.remove(disci);
    notifyListeners();
  }
  void editarDisciplina(Disciplina disci, Disciplina nuevaDisciplina ) {
    int index = disciplina.indexOf(disci);
    if (index != -1) {
      disciplina[index] = disci;

      notifyListeners();
    }
  }
  void updatePrecio(Disciplina d, int indexPrecio, Precio nuevoPrecio) {
    int indexDisciplina = disciplina.indexOf(d);
    if (indexDisciplina != -1) {
      disciplina[indexDisciplina].updatePrecio(indexPrecio, nuevoPrecio);
      notifyListeners();
    }
  }
  // Agrega otros métodos, como eliminar o editar, si los necesitas
}