import 'package:flutter/material.dart';

class ComparadorScreen extends StatefulWidget {
  // Mude para Stateful!
  @override
  _ComparadorScreenState createState() => _ComparadorScreenState();
}

class _ComparadorScreenState extends State<ComparadorScreen> {
  final _formKey = GlobalKey<FormState>();
  String? origem, destino;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comparar Milhas")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Origem"),
                validator: (value) =>
                    value!.isEmpty ? "Campo obrigatório" : null,
                onSaved: (value) => origem = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Destino"),
                validator: (value) =>
                    value!.isEmpty ? "Campo obrigatório" : null,
                onSaved: (value) => destino = value,
              ),
              ElevatedButton(onPressed: _buscarMilhas, child: Text("Buscar")),
            ],
          ),
        ),
      ),
    );
  }

  void _buscarMilhas() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushNamed(
        context,
        '/vale-a-pena',
        arguments: {'origem': origem, 'destino': destino}, // Passa dados!
      );
    }
  }
}
