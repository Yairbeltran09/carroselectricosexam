import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authprovider.dart';
import 'carros_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: "Usuario"),
            ),
            TextField(
              controller: _passController,
              decoration: InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final authProvider = Provider.of<AuthProvider>(
                  context,
                  listen: false,
                );
                bool success = await authProvider.login(
                  _userController.text,
                  _passController.text,
                );

                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CarrosScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error en el inicio de sesión")),
                  );
                }
              },
              child: Text("Iniciar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
