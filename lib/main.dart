import 'package:caca_milhas/pages/comparador_screen.dart';
import 'package:caca_milhas/pages/dashboard_screen.dart';
import 'package:caca_milhas/pages/detalhes_screen.dart';
import 'package:caca_milhas/pages/historico_screen.dart';
import 'package:caca_milhas/pages/mapa_screen.dart';
import 'package:caca_milhas/pages/perfil_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CacadorDeMilhasApp());
}

class CacadorDeMilhasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caçador de Milhas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/comparar': (context) => ComparadorScreen(),
        '/historico': (context) => HistoricoScreen(),
        '/detalhes': (context) => DetalhesScreen(),
        '/perfil': (context) => PerfilScreen(),
      },
    );
  }
}
