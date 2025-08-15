import 'package:flutter/material.dart';

class DetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final destino = args['destino'];

    return Scaffold(
      appBar: AppBar(title: Text("Detalhes da Rota")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destino,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.airplanemode_active),
              title: Text("Milhas necessárias"),
              subtitle: Text("15.000 milhas"),
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text("Taxas"),
              subtitle: Text("R\$ 250,00"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Voltar ao mapa"),
            ),
          ],
        ),
      ),
    );
  }
}
