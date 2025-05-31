import 'package:flutter/material.dart';
import '../../services/alumnos_service.dart';

class AlumnosScreen extends StatefulWidget {
  @override
  _AlumnosScreenState createState() => _AlumnosScreenState();
}

class _AlumnosScreenState extends State<AlumnosScreen> {
  final AlumnosService _alumnosService = AlumnosService();
  List<Map<String, dynamic>> _alumnos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _cargarAlumnos();
  }

  Future<void> _cargarAlumnos() async {
    setState(() => _isLoading = true);
    try {
      final alumnos = await _alumnosService.getAll();
      setState(() {
        _alumnos = List<Map<String, dynamic>>.from(alumnos);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar alumnos: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _eliminarAlumno(String id) async {
    try {
      await _alumnosService.delete(id);
      await _cargarAlumnos();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Alumno eliminado con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar alumno: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnos'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _alumnos.length,
              itemBuilder: (context, index) {
                final alumno = _alumnos[index];
                return ListTile(
                  title: Text(alumno['nombre'] ?? ''),
                  subtitle: Text(alumno['email'] ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _eliminarAlumno(alumno['id'].toString()),
                  ),
                  onTap: () {
                    // Navegar a la pantalla de edición
                    // Navigator.push(...);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de creación
          // Navigator.push(...);
        },
        child: Icon(Icons.add),
      ),
    );
  }
} 