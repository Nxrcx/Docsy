import 'package:flutter/material.dart';

class RecoveryScreen extends StatefulWidget {
  @override
  _RecoveryScreenState createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  bool isPressedRecover =
      false; // Variable para el botón de recuperar contraseña
  bool isFocusedEmail = false; // Para el enfoque del campo de correo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo azul oscuro
          Container(
            color: const Color(0xFF112B85),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png", width: 150),
                  const SizedBox(height: 20),

                  // Campo de correo
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        isFocusedEmail = hasFocus;
                      });
                    },
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Correo electrónico",
                        filled: true,
                        fillColor: isFocusedEmail
                            ? const Color(0xFF112B85)
                            : Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: TextStyle(
                          color: isFocusedEmail ? Colors.white : Colors.black,
                        ),
                      ),
                      style: TextStyle(
                          color: isFocusedEmail ? Colors.white : Colors.black),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botón de recuperar contraseña
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPressedRecover = true;
                      });
                      Future.delayed(const Duration(milliseconds: 200), () {
                        setState(() {
                          isPressedRecover = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Instrucciones enviadas al correo'),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressedRecover
                          ? const Color(0xFF112B85)
                          : Colors.white,
                      foregroundColor: isPressedRecover
                          ? Colors.white
                          : const Color(0xFF112B85),
                      elevation: 5,
                      minimumSize:
                          const Size(double.infinity, 50), // Tamaño original
                    ),
                    child: const Text("Recuperar Contraseña"),
                  ),

                  const SizedBox(height: 20),

                  // Botón de volver al inicio de sesión
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Regresar a la pantalla anterior
                    },
                    child: const Text(
                      'Volver al inicio de sesión',
                      style: TextStyle(
                          color: Color(0xffffffff)), // Mismo color que el fondo
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
