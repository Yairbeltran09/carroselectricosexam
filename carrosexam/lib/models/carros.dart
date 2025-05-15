class Carro {
  final String id;
  final String marca;
  final String modelo;
  final int anio;

  Carro({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.anio,
  });

  factory Carro.fromJson(Map<String, dynamic> json) {
    return Carro(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      anio: json['anio'],
    );
  }
}
