import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OfrendaScreen extends StatefulWidget {
  const OfrendaScreen({super.key});

  @override
  State<OfrendaScreen> createState() => _OfrendaScreenState();
}

class _OfrendaScreenState extends State<OfrendaScreen> {
  // Controladores para el formulario de tarjeta
  final _nombreTarjetaController = TextEditingController();
  final _numeroTarjetaController = TextEditingController();
  final _cvvController = TextEditingController();
  final _vencimientoController = TextEditingController();
  final _montoController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _nitController = TextEditingController();
  final _telefonoController = TextEditingController();

  // Variables de Estado
  String _monedaBancosActual = "Quetzales"; 
  String _monedaSeleccionada = "Q. (Quetzales)";
  String _tipoOfrendaSeleccionada = "Ofrenda";
  
  final List<String> _monedas = ["Q. (Quetzales)", "\$ (Dólares)"];
  final List<String> _tiposOfrenda = [
    "Ofrenda", "Diezmo", "Donación", "Banco de alimentos", 
    "Promesa de Fe", "CDD-Antigua G.", "CDD-Norte"
  ];

  // Función para copiar al portapapeles (Solo el número)
  void _copiarCuenta(String cuentaCompleta) {
    final soloNumero = cuentaCompleta.split(':').last.trim();
    Clipboard.setData(ClipboardData(text: soloNumero));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Número $soloNumero copiado"), 
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Ruleta estilo iPhone (Cupertino)
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
                onSelectedItemChanged: (index) => setState(() => onSelected(opciones[index])),
                children: opciones.map((e) => Center(child: Text(e, style: const TextStyle(fontSize: 18)))).toList(),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("", style: GoogleFonts.newsreader(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopHeader(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Depósito / Transferencia / ACH"),
                  const SizedBox(height: 15),

                  // SELECTOR DE MONEDA (BOTONES)
                  Row(
                    children: [
                      Expanded(child: _botonSelectorMoneda("Quetzales")),
                      const SizedBox(width: 10),
                      Expanded(child: _botonSelectorMoneda("Dólares")),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // TARJETAS DE BANCO DINÁMICAS
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _monedaBancosActual == "Quetzales"
                      ? _bankCard("Quetzales", [
                          "Banco Industrial: 053-012924-6",
                          "Banrural: 3355000150",
                          "BAC: 900175142",
                          "G&T: 008-5001754-5"
                        ], key: const ValueKey('gtq'))
                      : _bankCard("Dólares", [
                          "Banco Industrial: 053-012925-3",
                          "G&T: 009-5800044-9"
                        ], key: const ValueKey('usd')),
                  ),
                  _avisoBox(),

                  const SizedBox(height: 30),
                  _sectionTitle("Otros métodos"),
                  const SizedBox(height: 15),
                  _methodButton("Pagar con PayPal", const Color(0xFF003087), Icons.payment),
                  _methodButton("Pagar por Tithe.ly", const Color(0xFF2ecc71), Icons.sms),

                  const SizedBox(height: 30),
                  _sectionTitle("En línea con tu tarjeta"),
                  const SizedBox(height: 15),
                  _buildCardForm(),

                  const SizedBox(height: 40),
                  const Text("¿Eres Nuevo aquí?", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 18)),
                  const SizedBox(height: 20),
                  _bannerFinal("Mi siguiente paso", "Crece en tu fe", const Color(0xFF003366), Icons.directions_walk),
                  _bannerFinal("Una palabra para tu vida", "Mensaje diario", const Color(0xFF0A0A0A), Icons.auto_stories),
                  _bannerFinal("¿Necesitas una oración?", "Estamos contigo", const Color(0xFF003366), Icons.favorite),
                  
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Stack(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: Image.asset('assets/images/dona.png', fit: BoxFit.cover),
        ),
        Container(
          height: 320,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            ),
          ),
        ),
        Positioned(
          bottom: 30, left: 20, right: 20,
          child: Column(
            children: [
              Text("Salmo 20:1-4", style: GoogleFonts.newsreader(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                "Jehová te oiga en el día de conflicto; el nombre del Dios de Jacob te defienda. Te envíe ayuda desde el santuario, y desde Sion te sostenga. Haga memoria de todas tus ofrendas, y acepte tus holocaustos. Te dé conforme al deseo de tu corazón, y cumpla todo tu consejo.",
                textAlign: TextAlign.center,
                style: GoogleFonts.newsreader(color: Colors.white.withOpacity(0.9), fontSize: 14.5, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _botonSelectorMoneda(String moneda) {
    bool esActivo = _monedaBancosActual == moneda;
    return GestureDetector(
      onTap: () => setState(() => _monedaBancosActual = moneda),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 45,
        decoration: BoxDecoration(
          color: esActivo ? const Color(0xFF13A4EC) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: esActivo ? const Color(0xFF13A4EC) : Colors.grey.shade300),
          boxShadow: esActivo ? [BoxShadow(color: const Color(0xFF13A4EC).withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))] : [],
        ),
        child: Center(
          child: Text(moneda, style: TextStyle(color: esActivo ? Colors.white : Colors.grey.shade700, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _bankCard(String titulo, List<String> cuentas, {required Key key}) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cuentas en $titulo", style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF003087))),
          const Divider(height: 20),
          ...cuentas.map((c) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(c, style: const TextStyle(fontSize: 13))),
                IconButton(icon: const Icon(Icons.copy, size: 18, color: Color(0xFF13A4EC)), onPressed: () => _copiarCuenta(c)),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildCardForm() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 14, color: Colors.green),
              const SizedBox(width: 5),
              Text("SSL SECURE GLOBAL SIGN BY GMO", style: GoogleFonts.newsreader(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 20),
          _formField("Nombre en la tarjeta", _nombreTarjetaController, "Como aparece en tu tarjeta"),
          _formField("Número de tarjeta", _numeroTarjetaController, "0000 0000 0000 0000", isNumber: true),
          Row(
            children: [
              Expanded(child: _formField("CVV", _cvvController, "123", isNumber: true)),
              const SizedBox(width: 10),
              Expanded(child: _formField("Vence", _vencimientoController, "MM / YY")),
            ],
          ),
          Row(
            children: [
              Expanded(child: _pickerTrigger("Moneda", _monedaSeleccionada, () {
                _mostrarPicker("Moneda", _monedas, (v) => _monedaSeleccionada = v);
              })),
              const SizedBox(width: 10),
              Expanded(child: _pickerTrigger("Tipo", _tipoOfrendaSeleccionada, () {
                _mostrarPicker("Tipo de Ofrenda", _tiposOfrenda, (v) => _tipoOfrendaSeleccionada = v);
              })),
            ],
          ),
          _formField("Monto", _montoController, "0.00", isNumber: true),
          _formField("Email", _emailController, "correo@ejemplo.com"),
          _formField("Confirmar Email", _confirmEmailController, "correo@ejemplo.com"),
          _formField("NIT (Opcional Solo Guatemala)", _nitController, "123456-7"),
          _formField("Teléfono", _telefonoController, "+502 1234-5678", isNumber: true),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity, height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF13A4EC), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text("REALIZAR PAGO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  // Widgets Auxiliares
  Widget _sectionTitle(String text) => Text(text, style: GoogleFonts.newsreader(fontSize: 20, fontWeight: FontWeight.bold));

  Widget _avisoBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
      child: const Text("Notifica tu ofrenda a recibos@casadedios.org para tu recibo. Sino se emitira C/F", style: TextStyle(fontSize: 11, color: Color(0xFF003087))),
    );
  }

  Widget _methodButton(String label, Color color, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity, height: 55,
      child: ElevatedButton.icon(
        onPressed: () {}, icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(backgroundColor: color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }

  Widget _formField(String label, TextEditingController controller, String hint, {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint, filled: true, fillColor: const Color(0xFFF9FAFB),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade200)),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _pickerTrigger(String label, String valor, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(valor, style: const TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis)),
                const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _bannerFinal(String titulo, String sub, Color color, IconData icon) {
    return Container(
      width: double.infinity, margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text(sub, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}