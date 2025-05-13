import 'package:flutter/material.dart';
import 'package:sistema_gym/objetos/pago.dart';
import 'package:intl/intl.dart';
import 'package:sistema_gym/objetos/gasto.dart';

class FinanzasProvider extends ChangeNotifier {

  final Map<String, double> _pagosPorMes = {};
  final Map<String, double> _gastosPorMes = {};

  Map<String, double> get pagosPorMes => Map.unmodifiable(_pagosPorMes);

  void agregarPago(Pago nuevoPago) {
    String mesKey = DateFormat('MMMM', 'es_ES').format(nuevoPago.getFechaDePago());
    mesKey = '${mesKey[0].toUpperCase()}${mesKey.substring(1)}';

    if (_pagosPorMes.containsKey(mesKey)) {
      _pagosPorMes[mesKey]=_pagosPorMes[mesKey]! + nuevoPago.getMonto();
    } else {
      _pagosPorMes[mesKey] = nuevoPago.getMonto();
    }
    notifyListeners();
  }
  void agregarGasto(Gasto nuevoGasto) {
    String mes = DateFormat('MMMM', 'es_ES').format(nuevoGasto.getFecha());
    if (_gastosPorMes.containsKey(mes)) {
      _gastosPorMes[mes] = _gastosPorMes[mes]! + nuevoGasto.getMonto();
    } else {
      _gastosPorMes[mes] = nuevoGasto.getMonto();
    }
    notifyListeners();
  }

  void eliminarPago(Pago pago) {
    String mesKey = DateFormat('MMMM', 'es_ES').format(pago.getFechaDePago());
    mesKey = '${mesKey[0].toUpperCase()}${mesKey.substring(1)}';
    if (_pagosPorMes.containsKey(mesKey)) {
      _pagosPorMes[mesKey] = _pagosPorMes[mesKey]! - pago.getMonto();
      notifyListeners();
    }
  }

  void eliminarGasto(Gasto gasto) {
    String mesKey = DateFormat('MMMM', 'es_ES').format(gasto.getFecha());
    if (_gastosPorMes.containsKey(mesKey)) {
      _gastosPorMes[mesKey] = _gastosPorMes[mesKey]! - gasto.getMonto();
      notifyListeners();
    }
  }
}