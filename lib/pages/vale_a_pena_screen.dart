import 'package:flutter/material.dart';

class ValeAPenaScreen extends StatelessWidget {
  final Map argumentos; // Adicione este parâmetro

  ValeAPenaScreen({required this.argumentos}); // Construtor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vale a Pena?')),
      body: Center(
        child: Column(
          children: [
            Text('Rota: ${argumentos['origem']} → ${argumentos['destino']}'),
            // ... (resto do seu código)
          ],
        ),
      ),
    );
  }
}
