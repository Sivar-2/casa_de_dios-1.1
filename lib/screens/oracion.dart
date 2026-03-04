import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class OracionScreen extends StatefulWidget {
  const OracionScreen({super.key});

  @override
  State<OracionScreen> createState() => _OracionScreenState();
}

class _OracionScreenState extends State<OracionScreen> {
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _peticionController = TextEditingController();
  final _fechaController = TextEditingController();

  String _paisSeleccionado = "Selecciona un país";
  String _sexoSeleccionado = "Selecciona sexo";
  String _estadoCivilSeleccionado = "Selecciona estado civil";
  String _tipoPeticionSeleccionada = "Selecciona tipo";

  final List<String> _paises = ["Guatemala", "México", "Estados Unidos", "España", "Colombia", "Argentina", "El Salvador", "Honduras"];
  final List<String> _generos = ["Masculino", "Femenino"];
  final List<String> _estadosCiviles = ["Soltero", "Casado", "Unido", "Viudo", "Divorciado", "Separado"];
  final List<String> _tiposPeticion = ["Sanidad", "Matrimonio", "Familia", "Finanzas", "Liberación", "Otro"];

  bool get _formularioValido {
    return _nombreController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _peticionController.text.isNotEmpty &&
        _fechaController.text.isNotEmpty &&
        _paisSeleccionado != "Selecciona un país" &&
        _sexoSeleccionado != "Selecciona sexo" &&
        _estadoCivilSeleccionado != "Selecciona estado civil" &&
        _tipoPeticionSeleccionada != "Selecciona tipo";
  }

  void _mostrarPicker(String titulo, List<String> opciones, Function(String) onSelected) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(child: const Text("Cerrar"), onPressed: () => Navigator.pop(context)),
                  Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  CupertinoButton(child: const Text("Listo"), onPressed: () => Navigator.pop(context)),
                ],
              ),
            ),
            Expanded(
              child: CupertinoPicker(
                itemExtent: 40,
                onSelectedItemChanged: (index) {
                  setState(() => onSelected(opciones[index]));
                },
                children: opciones.map((e) => Center(child: Text(e))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      // Hacemos el AppBar transparente para que se vea la imagen detrás
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white), // Cambiado a blanco para visibilidad
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("", 
          style: GoogleFonts.newsreader(fontWeight: FontWeight.bold, color: Colors.white)), // Cambiado a blanco
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 1. IMAGEN DE FONDO SUPERIOR
          Container(
            height: 280, // Ajusta la altura que desees que cubra la imagen
            width: double.infinity,
            child: Image.asset(
              '/assets/images/orac2.png', // Tu ruta de imagen
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: const Color(0xFF13A4EC)),
            ),
          ),
          // 2. GRADIENTE PARA MEJORAR LECTURA (Opcional)
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // 3. CONTENIDO DEL FORMULARIO
          SingleChildScrollView(
            // Añadimos padding superior para que el texto empiece después del área del AppBar
            padding: const EdgeInsets.only(top: kToolbarHeight + 40, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("", 
                  style: GoogleFonts.newsreader(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 15),
                Text(
                  "Estamos interesados en ti y en tus necesidades, y creemos que Dios responderá toda petición que hagamos de común acuerdo. Envía tu petición y junto a un equipo de intercesión estaremos orando por ella.",
                  style: GoogleFonts.newsreader(fontSize: 16, color: Colors.white.withOpacity(0.9)),
                ),
                const SizedBox(height: 25),
                // Contenedor blanco para el formulario para que resalte sobre el fondo si es necesario
                // o puedes dejarlo directamente sobre el fondo gris inferior
                const Text(
                  "Para enviar tu petición debes llenar el siguiente formulario",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 25),

                // El resto del formulario permanece igual
                _inputField("Nombre", _nombreController, "Tu nombre completo"),
                _inputField("Email", _emailController, "tucorreo@ejemplo.com"),
                
                Row(
                  children: [
                    Expanded(child: _pickerTrigger("País", _paisSeleccionado, () {
                      _mostrarPicker("Selecciona País", _paises, (val) => _paisSeleccionado = val);
                    })),
                    const SizedBox(width: 15),
                    Expanded(child: _dateTrigger("Nacimiento", _fechaController)),
                  ],
                ),

                Row(
                  children: [
                    Expanded(child: _pickerTrigger("Sexo", _sexoSeleccionado, () {
                      _mostrarPicker("Selecciona Sexo", _generos, (val) => _sexoSeleccionado = val);
                    })),
                    const SizedBox(width: 15),
                    Expanded(child: _pickerTrigger("Estado Civil", _estadoCivilSeleccionado, () {
                      _mostrarPicker("Estado Civil", _estadosCiviles, (val) => _estadoCivilSeleccionado = val);
                    })),
                  ],
                ),

                _pickerTrigger("Tipo de petición", _tipoPeticionSeleccionada, () {
                  _mostrarPicker("Tipo de Petición", _tiposPeticion, (val) => _tipoPeticionSeleccionada = val);
                }),

                const Text("Tu petición", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 8),
                TextField(
                  controller: _peticionController,
                  maxLines: 5,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "escribe tu petición:",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _formularioValido ? () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Petición enviada con éxito")));
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF13A4EC),
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text("Enviar Petición", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),

                const SizedBox(height: 40),
                const Text("¿Eres Nuevo aquí?", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 18)),
                const SizedBox(height: 20),

                _bannerNuevo(
                  "Mi siguiente paso", 
                  "Descubre cómo involucrarte", 
                  const Color(0xFF003366),
                  Icons.directions_walk
                ),
                const SizedBox(height: 15),
                _bannerNuevo(
                  "Una palabra para tu vida", 
                  "Mensajes de aliento diarios", 
                  const Color(0xFF0A0A0A),
                  Icons.menu_book
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // WIDGETS AUXILIARES (Sin cambios de funcionamiento)
  Widget _inputField(String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _pickerTrigger(String label, String valor, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(valor, style: TextStyle(color: valor.contains("Selecciona") ? Colors.grey : Colors.black))),
                const Icon(Icons.expand_more, color: Colors.grey),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _dateTrigger(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context, initialDate: DateTime.now(),
              firstDate: DateTime(1920), lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              setState(() {
                controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.text.isEmpty ? "Día/Mes/Año" : controller.text, 
                  style: TextStyle(color: controller.text.isEmpty ? Colors.grey : Colors.black, fontSize: 13)),
                const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _bannerNuevo(String titulo, String sub, Color color, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 10)]
      ),
      child: Stack(
        children: [
          Positioned(right: -10, top: -10, child: Icon(icon, color: Colors.white.withOpacity(0.1), size: 100)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 5),
              Text(sub, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text("Conocer más", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}