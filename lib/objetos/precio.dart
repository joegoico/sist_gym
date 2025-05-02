class Precio {
  int _cantDias;
  double _precio;

  Precio({
    required int cantDias,
    required double precio,
  })  : _cantDias = cantDias,
        _precio = precio;

  void setCantDias(int cantDias) {
    _cantDias = cantDias;
  }

  void setPrecio(double precio) {
    _precio = precio;
  }

  int getCantDias() {
    return _cantDias;
  }

  double getPrecio() {
    return _precio;
  }
}