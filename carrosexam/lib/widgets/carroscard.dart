import 'package:flutter/material.dart';
import '../models/carros.dart';

class CarroCard extends StatelessWidget {
  final Carro carro;

  CarroCard({required this.carro});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${carro.marca} ${carro.modelo}"),
        subtitle: Text("Año: ${carro.anio}"),
      ),
    );
  }
}
