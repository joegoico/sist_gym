class Pago{
  int _id;
  DateTime _fechaDePago;
  double _monto;
  bool _descuento;

  Pago({
    required int id,
    required DateTime fechaDePago,
    required double monto,
    required bool descuento,
  }) : _id = id, _fechaDePago = fechaDePago, _monto = monto, _descuento = descuento;
  void setId(int id) {
    _id = id;
  }
  void setFechaDePago(DateTime fechaDePago) {
    _fechaDePago = fechaDePago;
  }
  void setMonto(double monto) {
    _monto = monto;
  }
  void setDescuento(bool descuento) {
    _descuento = descuento;
  }
  int getId() {
    return _id;
  }
  DateTime getFechaDePago() {
    return _fechaDePago;
  }
  double getMonto() {
    return _monto;
  }
  bool getDescuento() {
    return _descuento;
  }
  
}