class MockData {
  static List<Map<String, String>> promocoes = [
    {"rota": "Rio → Miami", "milhas": "12.000"},
    {"rota": "Brasília → Orlando", "milhas": "14.500"},
    {"rota": "Recife → Lisboa", "milhas": "18.000"},
  ];

  static List<String> rotasFavoritas = [
    "São Paulo → Paris",
    "São Paulo → Barcelona",
  ];

  static Map<String, dynamic> rotaAtual = {
    "rota": "São Paulo → Nova York",
    "precoAtual": 22000,
    "mediaHistorica": 18000,
    "progresso": 0.65,
  };

  static Map<String, dynamic> proximaOportunidade = {
    "rota": "São Paulo → Buenos Aires",
    "diasRestantes": 2,
  };
}
