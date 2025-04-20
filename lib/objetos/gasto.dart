class Gasto {
  String titulo;
  double monto;
  DateTime fecha;
  String? descripcion;

  Gasto({
    required this.titulo,
    required this.monto,
    required this.fecha,
    this.descripcion,
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'monto': monto,
      'fecha': fecha.toIso8601String(),
    };
  }

  static Gasto fromJson(Map<String, dynamic> json) {
    return Gasto(
      titulo: json['titulo'],
      monto: json['monto'],
      fecha: DateTime.parse(json['fecha']),
    );
  }
}