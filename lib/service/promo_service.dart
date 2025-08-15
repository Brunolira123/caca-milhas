class PromoService {
  static Future<List<Map<String, dynamic>>> buscarPromocoes() async {
    await Future.delayed(Duration(seconds: 1)); // simula API
    return [
      {"rota": "GRU → NYC", "milhas": 15000, "desconto": 60},
      {"rota": "POA → MIA", "milhas": 18000, "desconto": 50},
    ];
  }
}
