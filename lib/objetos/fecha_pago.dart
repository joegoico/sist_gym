class Pago{
  int id;
  DateTime fechaDePago;
  double monto;
  bool descuento;

  Pago({
    required this.id,
    required this.fechaDePago,
    required this.monto,
    required this.descuento,
  });
  void setId(int id) {
    this.id = id;
  }
  void setFechaDePago(DateTime fechaDePago) {
    this.fechaDePago = fechaDePago;
  }
  void setMonto(double monto) {
    this.monto = monto;
  }
  void setDescuento(bool descuento) {
    this.descuento = descuento;
  }
  int getId() {
    return id;
  }
  DateTime getFechaDePago() {
    return fechaDePago;
  }
  double getMonto() {
    return monto;
  }
  bool getDescuento() {
    return descuento;
  }
  
}