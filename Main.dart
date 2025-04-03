import 'package:flutter/material.dart';
import 'package:trabajo/login_screen.dart';

void main() {
  runApp(const FierryDocsApp());
}

class FierryDocsApp extends StatelessWidget {
  const FierryDocsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPressed = false; // Estado para controlar el color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: const Color(0xFF112B85), // Fondo azul oscuro
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido a Docsy',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/logo.png',
                width: 249,
                height: 337,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    isPressed = true;
                  });
                },
                onTapUp: (_) {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    setState(() {
                      isPressed = false;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  });
                },
                onTapCancel: () {
                  setState(() {
                    isPressed = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 180, // Tamaño fijo del botón
                  height: 50, // Altura fija
                  alignment:
                      Alignment.center, // Centra el texto dentro del botón
                  decoration: BoxDecoration(
                    color: isPressed
                        ? const Color(0xFF112B85)
                        : Colors.white, // Cambio de color
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xFF112B85), width: 2), // Borde azul
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isPressed
                          ? Colors.white
                          : const Color(0xFF112B85), // Cambio de texto
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
