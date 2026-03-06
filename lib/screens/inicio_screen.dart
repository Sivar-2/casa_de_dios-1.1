import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/bible_api.dart'; 

// IMPORTANTE: Ya conectamos Biblia y Oración. 
// Cuando crees los demás archivos, quita las "//" de los otros imports.
import 'bible.dart';
// import 'devocional.dart';
import 'oracion.dart'; 
import 'ofrenda.dart';
import 'ensenanza.dart';
// import 'grupo.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  // 1. INSTANCIA DE LA API
  final BibleApi _bibleApi = BibleApi(); 

  final Color colorPrimario = const Color(0xFF007AFF); 
  final Color colorFondo = const Color(0xFFF2F2F7);

  // 2. CONTROLADOR DEL SWIPE (PageView)
  late PageController _pageController;
  
  // 3. Índice actual. Orden: 0:Inicio, 1:Biblia, 2:Devocional, 3:Oración, 4:Ofrendas, 5:Enseñanzas, 6:Grupos
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Mueve la pantalla con animación al tocar botones
  void _navegarA(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Actualiza los botones de arriba cuando arrastras con el dedo (Swipe)
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFondo,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/lo_go.png', 
          height: 35,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () {}, 
          ),
        ],
      ),
      
      body: Column(
        children: [
          _crearNavegacionSuperior(),
          
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: const BouncingScrollPhysics(), 
              children: [
                _construirPantallaInicio(),      // Index 0: Inicio
                const BibliaScreen(),            // Index 1: Biblia
                const DevocionalScreen(),        // Index 2: Devocionales
                const OracionScreen(),           // Index 3: Oración (¡CONECTADA!)
                const OfrendaScreen(),           // Index 4: Ofrendas
                const EnsenanzaScreen(),         // Index 5: Enseñanzas
                const GrupoScreen(),             // Index 6: Grupos
                _construirPantallaVacia('Perfil'), // Index 7: Perfil
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimario,
        shape: const CircleBorder(),
        onPressed: () => _navegarA(4), 
        child: const Icon(Icons.volunteer_activism, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _iconoNavAbajo(Icons.home, 'Inicio', 0),
              _iconoNavAbajo(Icons.play_circle_outline, 'Media', 5), 
              const SizedBox(width: 40), 
              _iconoNavAbajo(Icons.event, 'Eventos', 6), 
              _iconoNavAbajo(Icons.person_outline, 'Perfil', 7),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirPantallaInicio() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _crearBannerVision(),
          _crearGridAcciones(),
          _crearSeccionPastores(),
          const SizedBox(height: 100), 
        ],
      ),
    );
  }

  Widget _construirPantallaVacia(String titulo) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titulo, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: colorPrimario)),
          const SizedBox(height: 20),
          const Text('Contenido en construcción', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _crearNavegacionSuperior() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _itemNavSuperior('Inicio', 0),
            _itemNavSuperior('Biblia', 1),
            _itemNavSuperior('Devocionales', 2),
            _itemNavSuperior('Oración', 3),
            _itemNavSuperior('Ofrendas', 4),
            _itemNavSuperior('Enseñanzas', 5),
            _itemNavSuperior('Grupos', 6),
          ],
        ),
      ),
    );
  }

  Widget _itemNavSuperior(String texto, int indexDestino) {
    bool activo = _currentIndex == indexDestino;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () => _navegarA(indexDestino),
        child: Column(
          children: [
            Text(
              texto,
              style: TextStyle(
                color: activo ? colorPrimario : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            if (activo)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 30,
                color: colorPrimario,
              )
          ],
        ),
      ),
    );
  }

  Widget _crearBannerVision() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorPrimario,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NUESTRA VISIÓN', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Hacer discípulos enseñándoles a guardar lo que Jesús nos mandó.', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Icon(Icons.auto_awesome, color: Colors.white38, size: 40),
        ],
      ),
    );
  }

  Widget _crearGridAcciones() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _navegarA(1), 
            child: FutureBuilder<Map<String, dynamic>>(
              future: _bibleApi.fetchRandomVerse(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  );
                }

                final data = snapshot.data ?? {
                  'texto': 'Porque yo sé los pensamientos que tengo acerca de vosotros...',
                  'libro': 'Jeremias',
                  'capitulo': 29,
                  'versiculo': 11
                };

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('VERSÍCULO DEL DÍA', style: TextStyle(color: colorPrimario, fontSize: 10, fontWeight: FontWeight.bold)),
                          const Icon(Icons.share, size: 16, color: Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('"${data['texto']}"', style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('— ${data['libro']} ${data['capitulo']}:${data['versiculo']}', 
                          style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _botonAccionRapida('Siguiente paso', 'Crece en tu fe', Icons.emoji_people, colorPrimario, 6)), 
              const SizedBox(width: 8),
              // ¡Este botón ahora te llevará a la pantalla de Oración real!
              Expanded(child: _botonAccionRapida('¿Necesitas oración?', 'Estamos contigo', Icons.volunteer_activism, const Color(0xFF0069D9), 3)), 
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _botonAccionRapida('Una palabra', 'Inspiración', Icons.auto_stories, const Color(0xFF0056B3), 2)), 
              const SizedBox(width: 8),
              Expanded(child: _botonAccionRapida('Podcast', 'Escuchar ahora', Icons.mic, Colors.black87, 5)), 
            ],
          ),
        ],
      ),
    );
  }

  Widget _botonAccionRapida(String titulo, String subtitulo, IconData icono, Color color, int indexDestino) {
    return InkWell(
      onTap: () => _navegarA(indexDestino), 
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icono, color: Colors.white, size: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                Text(subtitulo, style: const TextStyle(color: Colors.white70, fontSize: 10)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _crearSeccionPastores() {
    return InkWell(
      onTap: () {}, 
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            CircleAvatar(radius: 25, backgroundColor: colorPrimario, child: const Icon(Icons.person, color: Colors.white)),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pastores Cash y Sonia Luna', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('Dedicados a guiarte hacia una vida con mayor sentido espiritual.', style: TextStyle(color: Colors.grey, fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: colorPrimario),
          ],
        ),
      ),
    );
  }

  Widget _iconoNavAbajo(IconData icono, String texto, int indexDestino) {
    bool activo = _currentIndex == indexDestino;
    return InkWell(
      onTap: () => _navegarA(indexDestino),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, color: activo ? colorPrimario : Colors.grey),
          Text(texto, style: TextStyle(
            fontSize: 9, 
            color: activo ? colorPrimario : Colors.grey,
            fontWeight: activo ? FontWeight.bold : FontWeight.normal,
          )),
        ],
      ),
    );
  }
}

// =====================================================================
// PANTALLAS DE PRUEBA (SOLO QUEDAN LAS QUE NO HEMOS CREADO)
// =====================================================================

class DevocionalScreen extends StatelessWidget {
  const DevocionalScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Pantalla de Devocional', style: TextStyle(fontSize: 24, color: Colors.grey)));
}

// QUITAMOS ORACIONSCREEN DE AQUÍ PORQUE YA TIENE SU PROPIO ARCHIVO

class GrupoScreen extends StatelessWidget {
  const GrupoScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Pantalla de Grupos', style: TextStyle(fontSize: 24, color: Colors.grey)));
}