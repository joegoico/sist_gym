class Precio {
  int cantDias;
  double precio;

  Precio({
    required this.cantDias,
    required this.precio,
  });

  void setCantDias(int cantDias) {
    this.cantDias = cantDias;
  }
  void setPrecio(double precio) {
    this.precio = precio;
  }

  int getCantDias() {
    return cantDias;
  }
  double getPrecio() {
    return precio;
  }
}