import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assinatura Premium')),
      body: Column(
        children: [
          ListTile(title: Text('Alertas antecipados')),
          ListTile(title: Text('Histórico completo')),
          ListTile(title: Text('Filtros avançados')),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Pagar (Pix / Cartão)')),
        ],
      ),
    );
  }
}
