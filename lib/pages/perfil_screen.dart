import 'package:caca_milhas/pages/mock_data.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil / Configurações')),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Receber alertas'),
            value: true,
            onChanged: (val) {},
          ),
          ListTile(title: Text('Rotas favoritas')),
          ...MockData.rotasFavoritas.map((r) => ListTile(title: Text(r))),
          ListTile(title: Text('Plano atual: Grátis')),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/premium'),
            child: Text('Assinatura Premium'),
          ),
        ],
      ),
    );
  }
}
