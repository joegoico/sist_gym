class Gasto {
  String _titulo;
  double _monto;
  DateTime _fecha;
  String? _descripcion;

  Gasto({
    required String titulo,
    required double monto,
    required DateTime fecha,
    String? descripcion,
  })  : _titulo = titulo,
        _monto = monto,
        _fecha = fecha,
        _descripcion = descripcion;

  Map<String, dynamic> toJson() {
    return {
      'titulo': _titulo,
      'monto': _monto,
      'fecha': _fecha.toIso8601String(),
    };
  }

  static Gasto fromJson(Map<String, dynamic> json) {
    return Gasto(
      titulo: json['titulo'],
      monto: json['monto'],
      fecha: DateTime.parse(json['fecha']),
    );
  }
  void setTitulo(String titulo) {
    _titulo = titulo;
  }
  void setMonto(double monto) {
    _monto = monto;
  }
  void setFecha(DateTime fecha) {
    _fecha = fecha;
  }
  void setDescripcion(String descripcion) {
    _descripcion = descripcion;
  }
  String getDescripcion() {
    return _descripcion ?? '';
  }
  String getTitulo() {
    return _titulo;
  }
  double getMonto() {
    return _monto;
  }
  DateTime getFecha() {
    return _fecha;
  }
}