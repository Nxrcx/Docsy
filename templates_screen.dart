import 'package:flutter/material.dart';

class TemplatesScreen extends StatefulWidget {
  @override
  _TemplatesScreenState createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  bool isPressedTemplate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF112B85),
        title: const Text(
          "Plantillas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Texto blanco en el AppBar de plantillas
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white, // Flecha blanca
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: const Color(0xFF112B85), // Color de fondo con animación
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildTemplateCard(context, "Simple", "assets/simple.jpg", () {}),
              _buildTemplateCard(context, "Oficio", "assets/oficio.png", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          TemplateFormScreen(templateType: "Oficio")),
                );
              }),
              _buildTemplateCard(context, "Informe", "assets/informe.jpg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          TemplateFormScreen(templateType: "Informe")),
                );
              }),
              _buildTemplateCard(
                  context, "Hoja Blanca", "assets/hoja_blanca.jpg", () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTemplateCard(
      BuildContext context, String title, String imagePath, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF112B85), // Color de texto azul
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TemplateFormScreen extends StatefulWidget {
  final String templateType;

  const TemplateFormScreen({required this.templateType});

  @override
  _TemplateFormScreenState createState() => _TemplateFormScreenState();
}

class _TemplateFormScreenState extends State<TemplateFormScreen> {
  bool _isFocused = false; // Para animar el enfoque en los campos de texto
  bool _isButtonPressed = false; // Para controlar el estado del botón

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF112B85),
        title: Text(
          "Formulario para crear ${widget.templateType}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Texto blanco en el AppBar
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white, // Flecha blanca
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color:
            const Color(0xFF112B85), // Fondo animado con el mismo tono de azul
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildTextField("Firma"),
              const SizedBox(height: 20),
              _buildTextField("Destinatario"),
              const SizedBox(height: 20),
              _buildTextField("Hora y Fecha"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isButtonPressed = !_isButtonPressed;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Plantilla creada con éxito')),
                  );
                },
                child: const Text("Crear Plantilla"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonPressed
                      ? const Color(0xFF112B85)
                      : Colors.white, // Azul cuando se presiona
                  foregroundColor: _isButtonPressed
                      ? Colors.white
                      : const Color(
                          0xFF112B85), // Letras azules cuando no se presiona
                  elevation: 5,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(
            color: _isFocused ? const Color(0xFF112B85) : Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onTap: () {
          setState(() {
            _isFocused = true;
          });
        },
        onEditingComplete: () {
          setState(() {
            _isFocused = false;
          });
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF112B85)),
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }
}
