import 'package:flutter/material.dart';
import 'package:trabajo/register_screen.dart';
import 'package:trabajo/templates_screen.dart';
import 'package:trabajo/recover_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPressedLogin = false;
  bool isPressedRegister = false;
  bool isPressedRecover =
      false; // Variable para el botón de recuperar contraseña
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;

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

                  const SizedBox(height: 10),

                  // Campo de contraseña
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        isFocusedPassword = hasFocus;
                      });
                    },
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        filled: true,
                        fillColor: isFocusedPassword
                            ? const Color(0xFF112B85)
                            : Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: TextStyle(
                          color:
                              isFocusedPassword ? Colors.white : Colors.black,
                        ),
                      ),
                      obscureText: true,
                      style: TextStyle(
                          color:
                              isFocusedPassword ? Colors.white : Colors.black),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botón Iniciar Sesión
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPressedLogin = true;
                      });
                      Future.delayed(const Duration(milliseconds: 200), () {
                        setState(() {
                          isPressedLogin = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TemplatesScreen()));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressedLogin
                          ? const Color(0xFF112B85)
                          : Colors.white,
                      foregroundColor: isPressedLogin
                          ? Colors.white
                          : const Color(0xFF112B85),
                      elevation: 5,
                      minimumSize:
                          const Size(double.infinity, 50), // Tamaño original
                    ),
                    child: const Text("Iniciar sesión"),
                  ),

                  const SizedBox(height: 10), // Espaciado entre botones

                  // Botón de registro
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPressedRegister = true;
                      });
                      Future.delayed(const Duration(milliseconds: 200), () {
                        setState(() {
                          isPressedRegister = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RegisterScreen()));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressedRegister
                          ? const Color(0xFF112B85)
                          : Colors.white,
                      foregroundColor: isPressedRegister
                          ? Colors.white
                          : const Color(0xFF112B85),
                      elevation: 5,
                      minimumSize:
                          const Size(double.infinity, 50), // Tamaño original
                    ),
                    child: const Text("¿No tienes cuenta? Regístrate"),
                  ),

                  const SizedBox(height: 10),

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RecoveryScreen()));
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
                    child: const Text("¿Olvidaste tu contraseña?"),
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
