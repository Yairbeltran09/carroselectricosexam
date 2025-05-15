import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authprovider.dart';
import '../providers/carros_providers.dart';
import '../widgets/carroscard.dart';

class CarrosScreen extends StatefulWidget {
  @override
  _CarrosScreenState createState() => _CarrosScreenState();
}

class _CarrosScreenState extends State<CarrosScreen> {
  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final carrosProvider = Provider.of<CarrosProvider>(context, listen: false);
    carrosProvider.fetchCarros(authProvider.token!);
  }

  @override
  Widget build(BuildContext context) {
    final carrosProvider = Provider.of<CarrosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Mis Carros")),
      body: ListView.builder(
        itemCount: carrosProvider.carros.length,
        itemBuilder: (context, index) {
          return CarroCard(carro: carrosProvider.carros[index]);
        },
      ),
    );
  }
}
