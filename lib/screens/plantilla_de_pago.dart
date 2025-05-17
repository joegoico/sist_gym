import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  // Esta variable indica si el usuario tiene deudas pendientes.
  final bool hasDebt;

  const PaymentScreen({Key? key, required this.hasDebt}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isProcessing = false;

  // Función que simula la activación del proceso de pago.
  Future<void> _processPayment() async {
    setState(() {
      _isProcessing = true;
    });

    // Simulación de la llamada al backend: espera 2 segundos.
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isProcessing = false;
    });

    // Muestra un mensaje de confirmación.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Proceso de pago iniciado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Muestra el mensaje según si el usuario tiene o no deuda.
              widget.hasDebt
                  ? const Text(
                'Tienes deudas pendientes. Por favor, realiza el pago.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              )
                  : const Text(
                'No tienes deudas pendientes.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Si hay deuda, se muestra el botón para procesar el pago.
              widget.hasDebt
                  ? ElevatedButton(
                onPressed: _isProcessing ? null : _processPayment,
                child: _isProcessing
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                    : const Text('Iniciar Pago'),
              )
                  : Container(),
            ],
          ),
        ),
    );
  }
}