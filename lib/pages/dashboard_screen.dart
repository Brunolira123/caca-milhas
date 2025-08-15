import 'package:caca_milhas/pages/mock_data.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caçador de Milhas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // lógica de alertas
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAlertCard(),
            SizedBox(height: 16),
            _buildFavoriteRouteCard(),
            SizedBox(height: 16),
            _buildNextOpportunityCard(),
            SizedBox(height: 24),
            _buildActionGrid(context),
            SizedBox(height: 24),
            _buildPromotionsFeed(),
          ],
        ),
      ),
    );
  }

  // ----------------- CARDS -----------------
  Widget _buildAlertCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.flash_on, color: Colors.amber),
        title: Text(
          "PROMO RELÂMPAGO!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("GRU → NY por 15.000 milhas (60% off)"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // navegação para detalhes
        },
      ),
    );
  }

  Widget _buildFavoriteRouteCard() {
    final rota = MockData.rotaAtual;
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ROTA FAVORITA", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text(
              rota['rota'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: rota['progresso'],
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              "Preço atual: ${rota['precoAtual']} milhas (média histórica: ${rota['mediaHistorica']})",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextOpportunityCard() {
    final opp = MockData.proximaOportunidade;
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.access_time, color: Colors.blue),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PRÓXIMA OPORTUNIDADE",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    opp['rota'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Promoção prevista em ${opp['diasRestantes']} dias!",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------- GRID DE AÇÕES -----------------
  Widget _buildActionGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildActionButton(
          context,
          Icons.compare,
          "Comparar Milhas",
          '/comparar',
        ),
        _buildActionButton(
          context,
          Icons.timeline,
          "Histórico Preços",
          '/historico',
        ),
        _buildActionButton(
          context,
          Icons.map,
          "Mapa de Oportunidades",
          '/mapa',
        ),
        _buildActionButton(context, Icons.person, "Meu Perfil", '/perfil'),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return Card(
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.purple),
            SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // ----------------- FEED DE PROMOÇÕES -----------------
  Widget _buildPromotionsFeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "PROMOÇÕES RÁPIDAS",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: MockData.promocoes.length,
            itemBuilder: (context, index) {
              final promo = MockData.promocoes[index];
              return _buildPromoCard(promo['rota']!, promo['milhas']!);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPromoCard(String rota, String milhas) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 12),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(rota, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text("$milhas milhas", style: TextStyle(color: Colors.purple)),
              Spacer(),
              Text(
                "Válido por 24h",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
