import 'package:flutter/material.dart';
import 'screens/inicio_screen.dart';
import 'screens/login_screen.dart';
import 'screens/oracion.dart';

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
      theme: ThemeData(
        primaryColor: const Color(0xFF13A4EC),
        scaffoldBackgroundColor: const Color(0xFFF6F7F8),
        fontFamily: 'Inter',
      ),
      home: const LoadingScreen(),
    );
  }
}

// =======================================================================
// PANTALLA DE CARGA CON ANIMACIÓN DE DESVANECIMIENTO
// =======================================================================
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _opacity = 0.0; // Control de la animación de entrada

  @override
  void initState() {
    super.initState();
    
    // Inicia la animación de desvanecimiento (fade in)
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => _opacity = 1.0);
    });

    // Temporizador de 4 segundos antes de pasar al Login
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        _irAlLogin();
      }
    });
  }

  void _irAlLogin() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        // CAMBIO: Usa LoginScreen() en lugar de login_screen.dart()
        pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(), 
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Animación de desvanecimiento suave entre pantallas
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Eliminamos el fondo gris para que no interfiera con la imagen
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 1000),
        child: Stack(
          children: [
            // 1. Imagen de Fondo que ocupa TODA la pantalla
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/home2.png',
                fit: BoxFit.cover, // Esto hace que la imagen cubra toda la pantalla sin deformarse
                errorBuilder: (context, error, stackTrace) => 
                  Container(color: const Color(0xFFF6F7F8)), // Color de respaldo si falla la imagen
              ),
            ),

            // 2. Capa oscura opcional (para que el texto "Loading" se lea mejor)
            Container(color: Colors.black.withOpacity(0.2)),

            // 3. Contenido (Círculo de carga y texto) centrado
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.white, // Cambié a blanco para que resalte sobre el fondo
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Loading...', 
                    style: TextStyle(
                      color: Colors.white, // Cambié a blanco por visibilidad
                      fontSize: 16, 
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      shadows: [Shadow(blurRadius: 10, color: Colors.black)], // Sombra para leer mejor
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}