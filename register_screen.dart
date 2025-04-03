import 'package:flutter/material.dart';
import 'package:trabajo/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;
  bool isFocusedConfirmPassword = false;
  bool isPressedRegister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF112B85), // Mismo color que la pantalla
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30, // Tamaño más grande para la flecha
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0, // Eliminamos la sombra de la AppBar
      ),
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
                mainAxisAlignment: MainAxisAlignment
                    .start, // Alinea el contenido hacia la parte superior
                children: [
                  // Texto "Registrarse" movido un poco más arriba
                  const SizedBox(height: 40), // Espaciado superior ajustado
                  const Text(
                    "Registrarse",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color:
                          Colors.white, // Cambiamos el color del texto a blanco
                    ),
                  ),
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

                  const SizedBox(height: 10),

                  // Campo de confirmar contraseña
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        isFocusedConfirmPassword = hasFocus;
                      });
                    },
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Confirmar Contraseña",
                        filled: true,
                        fillColor: isFocusedConfirmPassword
                            ? const Color(0xFF112B85)
                            : Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: TextStyle(
                          color: isFocusedConfirmPassword
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      obscureText: true,
                      style: TextStyle(
                          color: isFocusedConfirmPassword
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botón Registrarse
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPressedRegister = true;
                      });
                      Future.delayed(const Duration(milliseconds: 200), () {
                        setState(() {
                          isPressedRegister = false;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
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
                    child: const Text("Registrarse"),
                  ),

                  const SizedBox(height: 10), // Espaciado entre botones

                  // Botón de iniciar sesión
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "¿Ya tienes una cuenta? Inicia sesión",
                      style: TextStyle(color: Colors.white),
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
