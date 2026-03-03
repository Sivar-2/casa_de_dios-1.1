import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// =======================================================================
// 1. PANTALLA PRINCIPAL DE BIBLIA (Esta va dentro del PageView del Inicio)
// =======================================================================
class BibliaScreen extends StatelessWidget {
  const BibliaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Al estar dentro de PageView, no necesita Scaffold, solo el contenido scrolleable
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HOY', style: GoogleFonts.montserrat(color: const Color(0xFF007AFF), fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1)),
                  Text('Miércoles, 24 Mayo', style: GoogleFonts.merriweather(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.calendar_today, color: Colors.amber),
              )
            ],
          ),
          const SizedBox(height: 20),
          
          // Card de Versículo del día
          _buildVersiculoCard(context),
          
          const SizedBox(height: 24),
          Text('Continuar leyendo', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          
          // Planes de Lectura
          _buildPlanLectura(),
          const SizedBox(height: 12),
          _buildAudioDevocional(),
          
          const SizedBox(height: 100), // Espacio para que el BottomNav no tape el contenido
        ],
      ),
    );
  }

  Widget _buildVersiculoCard(BuildContext context) {
    return Container(
      height: 420,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1502485019198-a625bd53ceb7?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80'),
          fit: BoxFit.cover,
        ),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.8)]
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.3))),
                child: const Text('VERSÍCULO DEL DÍA', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
              ),
            ),
            const Spacer(),
            Text(
              '"Porque yo sé muy bien los planes que tengo para ustedes —afirma el Señor—, planes de bienestar y no de calamidad..."',
              style: GoogleFonts.merriweather(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic, height: 1.5),
            ),
            const SizedBox(height: 12),
            Text('— Jeremías 29:11', style: GoogleFonts.montserrat(color: const Color(0xFF007AFF), fontWeight: FontWeight.bold, fontSize: 16)),
            const Text('Nueva Versión Internacional (NVI)', style: TextStyle(color: Colors.white70, fontSize: 12)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BibliaCompartirScreen())), 
                    icon: const Icon(Icons.share, size: 18), 
                    label: const Text('Compartir'), 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.2), foregroundColor: Colors.white, elevation: 0, padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))
                  )
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BibliaLecturaScreen())), 
                    icon: const Icon(Icons.menu_book, size: 18), 
                    label: const Text('Leer capítulo'), 
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007AFF), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlanLectura() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)),
      child: Row(
        children: [
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blue.shade50),
            child: const Icon(Icons.auto_stories, color: Color(0xFF007AFF), size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PLAN DE LECTURA', style: GoogleFonts.montserrat(fontSize: 10, color: const Color(0xFF007AFF), fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('30 Días de Esperanza', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: 0.45, backgroundColor: Colors.grey.shade200, color: const Color(0xFF007AFF), minHeight: 6, borderRadius: BorderRadius.circular(10)),
                const SizedBox(height: 4),
                Text('Día 12 de 30', style: GoogleFonts.montserrat(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildAudioDevocional() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)),
      child: Row(
        children: [
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade900),
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 35),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AUDIO DEVOCIONAL', style: GoogleFonts.montserrat(fontSize: 10, color: const Color(0xFF007AFF), fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Confianza en la tormenta', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Text('Pastor Cash Luna • 12 min', style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.play_circle_outline, color: Colors.grey),
        ],
      ),
    );
  }
}

// =======================================================================
// 2. INTERFAZ DE LECTURA (Con ajustes de fuente y Swipe para regresar)
// =======================================================================
class BibliaLecturaScreen extends StatefulWidget {
  const BibliaLecturaScreen({super.key});

  @override
  State<BibliaLecturaScreen> createState() => _BibliaLecturaScreenState();
}

class _BibliaLecturaScreenState extends State<BibliaLecturaScreen> {
  double _fontSize = 20.0;
  String _fontFamily = 'Lora'; // Opciones: Lora (Serif), Inter (Sans), Roboto Mono

  TextStyle get _currentTextStyle {
    if (_fontFamily == 'Inter') return GoogleFonts.inter();
    if (_fontFamily == 'Roboto Mono') return GoogleFonts.robotoMono();
    return GoogleFonts.lora();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Detecta Swipe de izquierda a derecha para regresar
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 15) Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
          centerTitle: true,
          title: Column(
            children: [
              Text('Salmo 23', style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: const Color(0xFF2B6CEE).withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: const Text('NVI', style: TextStyle(fontSize: 10, color: Color(0xFF2B6CEE), fontWeight: FontWeight.bold))),
            ],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.format_size, color: Colors.black), onPressed: _mostrarConfiguracion),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          children: [
             Text('Un salmo de David.', textAlign: TextAlign.center, style: _currentTextStyle.copyWith(fontSize: _fontSize - 4, fontStyle: FontStyle.italic, color: Colors.grey.shade600)),
             const SizedBox(height: 30),
             _buildVerse(1, "El Señor es mi pastor, nada me falta;"),
             _buildVerse(2, "en verdes pastos me hace descansar. Junto a tranquilas aguas me conduce;"),
             _buildVerse(3, "me infunde nuevas fuerzas. Me guía por sendas de justicia por amor a su nombre."),
             // Versículo subrayado
             Container(
               margin: const EdgeInsets.only(bottom: 24),
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(color: Colors.amber.shade100.withOpacity(0.5), border: const Border(left: BorderSide(color: Colors.amber, width: 4)), borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))),
               child: _buildVerse(4, "Aun si voy por valles tenebrosos, no temo peligro alguno porque tú estás a mi lado; tu vara de pastor me reconforta.", isHighlighted: true),
             ),
             _buildVerse(5, "Dispones ante mí un banquete en presencia de mis enemigos. Has ungido con perfume mi cabeza; has llenado mi copa a rebosar."),
             _buildVerse(6, "La bondad y el amor me seguirán todos los días de mi vida; y en la casa del Señor habitaré para siempre."),
          ],
        ),
      ),
    );
  }

  Widget _buildVerse(int num, String text, {bool isHighlighted = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isHighlighted ? 0 : 24),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: '$num  ', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade500)),
            TextSpan(text: text, style: _currentTextStyle.copyWith(fontSize: _fontSize, height: 1.6, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  void _mostrarConfiguracion() {
    showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('TIPOGRAFÍA', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _fontButton('Serif', 'Lora', setModalState),
                      const SizedBox(width: 8),
                      _fontButton('Sans', 'Inter', setModalState),
                      const SizedBox(width: 8),
                      _fontButton('Mono', 'Roboto Mono', setModalState),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TAMAÑO', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                      Text('${_fontSize.toInt()}px', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                  Slider(
                    value: _fontSize, 
                    min: 14, max: 32, 
                    activeColor: const Color(0xFF2B6CEE),
                    onChanged: (val) {
                      setModalState(() => _fontSize = val);
                      setState(() => _fontSize = val); // Actualiza la pantalla de fondo
                    }
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }

  Widget _fontButton(String label, String fontName, StateSetter setModalState) {
    bool isSelected = _fontFamily == fontName;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setModalState(() => _fontFamily = fontName);
          setState(() => _fontFamily = fontName);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2B6CEE).withOpacity(0.1) : Colors.white,
            border: Border.all(color: isSelected ? const Color(0xFF2B6CEE) : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(label, style: TextStyle(color: isSelected ? const Color(0xFF2B6CEE) : Colors.black, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        ),
      ),
    );
  }
}

// =======================================================================
// 3. INTERFAZ PARA COMPARTIR (Con marca de agua estética y Swipe back)
// =======================================================================
class BibliaCompartirScreen extends StatelessWidget {
  const BibliaCompartirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       // Detecta Swipe de izquierda a derecha para regresar
       onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 15) Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F8),
        appBar: AppBar(
          backgroundColor: Colors.white, elevation: 1,
          leading: IconButton(icon: const Icon(Icons.close, color: Colors.black), onPressed: () => Navigator.pop(context)),
          title: Text('Compartir Versículo', style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hecho', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2B6CEE))))],
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            // Contenedor de la Imagen con Marca de Agua
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8, 
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'), fit: BoxFit.cover),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 10))]
                ),
                child: Stack(
                  children: [
                    // Filtro oscuro
                    Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.black.withOpacity(0.4))),
                    // Texto
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('"El Señor es mi pastor, nada me falta."', textAlign: TextAlign.center, style: GoogleFonts.lora(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 16),
                          Text('SALMOS 23:1', style: GoogleFonts.inter(color: Colors.white70, letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    // MARCA DE AGUA @CasadeDiosOficial
                    Positioned(
                      bottom: 24, left: 0, right: 0,
                      child: Text('@CasadeDiosOficial', textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.white60, fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1.5)),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            
            // Botones sociales
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _socialIcon(Icons.content_copy, "Copiar", Colors.grey.shade800, Colors.grey.shade100),
                  _socialIcon(Icons.camera_alt, "Stories", Colors.white, Colors.pink),
                  _socialIcon(Icons.message, "WhatsApp", Colors.white, Colors.green),
                  _socialIcon(Icons.ios_share, "Más", Colors.grey.shade800, Colors.grey.shade100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, String label, Color iconColor, Color bgColor) {
    return Column(
      children: [
        Container(
          width: 50, height: 50,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle, boxShadow: bgColor == Colors.white ? [] : [BoxShadow(color: bgColor.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))]),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey.shade600, letterSpacing: 0.5))
      ],
    );
  }
}