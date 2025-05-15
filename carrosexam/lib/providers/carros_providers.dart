import 'package:flutter/material.dart';
import '../models/carros.dart';
import '../services/api_services.dart';

class CarrosProvider with ChangeNotifier {
  List<Carro> _carros = [];

  List<Carro> get carros => _carros;

  Future<void> fetchCarros(String token) async {
    final data = await ApiService.getCarros(token);
    if (data != null) {
      _carros = data.map((carro) => Carro.fromJson(carro)).toList();
      notifyListeners();
    }
  }
}
