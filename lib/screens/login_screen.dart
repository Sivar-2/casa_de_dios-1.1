import 'package:flutter/material.dart';
import 'inicio_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 1. Controladores para capturar el texto de los campos
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Función de validación de credenciales
  void _validarIngreso() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Verificamos las credenciales temporales que solicitaste
    if (email == 'ejemplo@casadedios.org' && password == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const InicioScreen()),
      );
    } else {
      // Mensaje de error visual si fallan las credenciales
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Credenciales incorrectas. Intenta de nuevo.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  void dispose() {
    // Limpieza de controladores para optimizar memoria
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 60),
              
              // LOGO PERSONALIZADO (Reemplazo del icono de Biblia)
              Container(
                width: 80, 
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF13A4EC).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/transp.png', // Ruta de tu logo
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.menu_book, color: Color(0xFF13A4EC), size: 40),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
              const Text(
                'Bienvenido a tu casa', 
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold, 
                  color: Color(0xFF0D171B)
                )
              ),
              const SizedBox(height: 12),
              const Text(
                'Ingresa tus credenciales para continuar', 
                style: TextStyle(fontSize: 16, color: Colors.grey)
              ),
              const SizedBox(height: 48),

              // Campo de entrada: Correo Electrónico
              _buildInputLabel('Correo Electrónico'),
              _buildTextField(
                'ejemplo@correo.com', 
                Icons.email_outlined, 
                controller: _emailController
              ),
              const SizedBox(height: 24),

              // Campo de entrada: Contraseña
              _buildInputLabel('Contraseña'),
              _buildTextField(
                '••••••••', 
                Icons.visibility_outlined, 
                isPassword: true, 
                controller: _passwordController
              ),
              
              const SizedBox(height: 60),

              // Botón Iniciar Sesión (Validación funcional integrada)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _validarIngreso,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF13A4EC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    elevation: 5,
                    shadowColor: const Color(0xFF13A4EC).withOpacity(0.3),
                  ),
                  child: const Text(
                    'Iniciar sesión', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 18, 
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Botón Crear Cuenta (Estético por ahora)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    // Acción para crear cuenta
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF13A4EC), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  child: const Text(
                    'Crear cuenta', 
                    style: TextStyle(
                      color: Color(0xFF13A4EC), 
                      fontSize: 16, 
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para las etiquetas de los campos
  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          label, 
          style: const TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.bold, 
            color: Color(0xFF1F2937)
          )
        ),
      ),
    );
  }

  // Widget auxiliar para construir los campos de texto
  Widget _buildTextField(
    String hint, 
    IconData icon, 
    {bool isPassword = false, required TextEditingController controller}
  ) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Color(0xFF0D171B)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        suffixIcon: Icon(icon, color: const Color(0xFF13A4EC)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
          borderSide: BorderSide(color: Colors.grey.shade200)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
          borderSide: BorderSide(color: Colors.grey.shade200)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
          borderSide: const BorderSide(color: Color(0xFF13A4EC), width: 2)
        ),
      ),
    );
  }
}