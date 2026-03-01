import 'package:flutter/material.dart';
import 'screens/inicio_screen.dart';

void main() {
  runApp(const CasaDeDiosApp());
}

class CasaDeDiosApp extends StatelessWidget {
  const CasaDeDiosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casa de Dios',
      debugShowCheckedModeBanner: false,
      // Aquí podemos cambiar el color principal más adelante para que coincida con el logo de la iglesia
      theme: ThemeData(
        primaryColor: const Color(0xFF007AFF),
        scaffoldBackgroundColor: const Color(0xFFF2F2F7), // Azul de tu diseño
      ),
      home: const InicioScreen(),
    );
  }
}

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _indiceActual = 0;

  final List<Widget> _pantallas = [
    const Center(child: Text('Inicio: Versículo y Anuncios', style: TextStyle(fontSize: 18))),
    const Center(child: Text('Calendario de Actividades', style: TextStyle(fontSize: 18))),
    const Center(child: Text('Prédicas y Transmisiones', style: TextStyle(fontSize: 18))),
    const Center(child: Text('Donaciones y Contacto', style: TextStyle(fontSize: 18))),
  ];

  void _alTocarItem(int index) {
    setState(() {
      _indiceActual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casa de Dios', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: _pantallas[_indiceActual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceActual,
        onTap: _alTocarItem,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Eventos'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_fill), label: 'Prédicas'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Apoyo'),
        ],
      ),
    );
  }
}  