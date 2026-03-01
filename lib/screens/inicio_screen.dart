import 'package:flutter/material.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  final Color colorPrimario = const Color(0xFF007AFF); // Azul de tu diseño
  final Color colorFondo = const Color(0xFFF2F2F7);

  // Variable que controla qué pantalla estamos viendo en el centro
  String _seccionActual = 'Inicio';

  // Función para cambiar la vista
  void _cambiarSeccion(String nuevaSeccion) {
    setState(() {
      _seccionActual = nuevaSeccion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFondo,
      
      // HEADER: Se mantiene en todas las pantallas con tu logo intacto
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/logoo.png', // Tu logo exacto como lo tenías
          height: 30,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () => _cambiarSeccion('Búsqueda'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () => _cambiarSeccion('Notificaciones'),
          ),
        ],
      ),

      // CUERPO: Depende de la sección seleccionada
      body: _seccionActual == 'Inicio' 
          ? _construirPantallaInicio() // Si es Inicio, muestra todo el diseño
          : _construirPantallaVacia(), // Si es otra opción, muestra solo el nombre

      // BOTÓN CENTRAL FLOTANTE (Donaciones)
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimario,
        shape: const CircleBorder(),
        onPressed: () => _cambiarSeccion('Donaciones'),
        child: const Icon(Icons.volunteer_activism, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // BARRA INFERIOR (Media y Eventos intercambiados)
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _iconoNavAbajo(Icons.home, 'Inicio'),
              // Media ahora está a la izquierda del botón central
              _iconoNavAbajo(Icons.play_circle_outline, 'Media'),
              const SizedBox(width: 40), // Espacio para el botón flotante
              // Eventos ahora está a la derecha del botón central
              _iconoNavAbajo(Icons.event, 'Eventos'),
              _iconoNavAbajo(Icons.person_outline, 'Perfil'),
            ],
          ),
        ),
      ),
    );
  }

  // =======================================================================
  // CONSTRUCTOR DEL INICIO (Aquí están los botones de arriba y el contenido)
  // =======================================================================
  Widget _construirPantallaInicio() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _crearNavegacionSuperior(), // Los botones de arriba SOLO están aquí
          _crearBannerVision(),
          _crearGridAcciones(),
          _crearSeccionPastores(),
          const SizedBox(height: 100), // Espacio para que la barra inferior no tape nada
        ],
      ),
    );
  }

  // =======================================================================
  // PANTALLA GENÉRICA (Para cuando tocas Biblia, Eventos, etc.)
  // =======================================================================
  Widget _construirPantallaVacia() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _seccionActual,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: colorPrimario),
          ),
          const SizedBox(height: 20),
          const Text('Contenido en construcción', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // =======================================================================
  // WIDGETS MODULARES
  // =======================================================================

  Widget _crearNavegacionSuperior() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _itemNavSuperior('Biblia', activo: true),
            _itemNavSuperior('Devocionales'),
            _itemNavSuperior('Oración'),
            _itemNavSuperior('Ofrendas'),
            _itemNavSuperior('Enseñanzas'),
            _itemNavSuperior('Grupos'),
          ],
        ),
      ),
    );
  }

  Widget _itemNavSuperior(String texto, {bool activo = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () => _cambiarSeccion(texto), // Al tocar, navega a esa sección
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
          Container(
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
                const Text('"Porque yo sé los pensamientos que tengo acerca de vosotros..."', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13)),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('— Jer. 29:11', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _botonAccionRapida('Siguiente paso', 'Crece en tu fe', Icons.emoji_people, colorPrimario)),
              const SizedBox(width: 8),
              Expanded(child: _botonAccionRapida('¿Necesitas oración?', 'Estamos contigo', Icons.volunteer_activism, const Color(0xFF0069D9))),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _botonAccionRapida('Una palabra', 'Inspiración', Icons.auto_stories, const Color(0xFF0056B3))),
              const SizedBox(width: 8),
              Expanded(child: _botonAccionRapida('Podcast', 'Escuchar ahora', Icons.mic, Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _botonAccionRapida(String titulo, String subtitulo, IconData icono, Color color) {
    return InkWell(
      onTap: () => _cambiarSeccion(titulo), // También navegan al tocarlos
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
      onTap: () => _cambiarSeccion('Pastores'),
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

  Widget _iconoNavAbajo(IconData icono, String texto) {
    // Si la sección actual es igual al texto del botón, se pinta de azul
    bool activo = _seccionActual == texto;

    return InkWell(
      onTap: () => _cambiarSeccion(texto),
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
