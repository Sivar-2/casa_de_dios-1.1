import 'dart:convert';
import 'package:http/http.dart' as http;

class BibleApi {
  // Tu API Key integrada
  final String _apiKey = "f3a0e6eda51c0c087f64eff09908f491";
  final String _baseUrl = "https://bibliaapi.com/api";

  /// Obtiene un versículo al azar en Reina Valera 1960
  Future<Map<String, dynamic>> fetchRandomVerse() async {
    final url = Uri.parse('$_baseUrl/random/rv1960');

    try {
      final response = await http.get(
        url,
        headers: {
          'apikey': _apiKey,
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // La API devuelve un objeto con: texto, libro, capitulo, versiculo
        return jsonDecode(response.body);
      } else {
        throw Exception('Fallo en la conexión: ${response.statusCode}');
      }
    } catch (e) {
      // Backup en caso de error o falta de internet
      return {
        'texto': 'Hacer discípulos enseñándoles a guardar lo que Jesús nos mandó.',
        'libro': 'Mateo',
        'capitulo': 28,
        'versiculo': 19
      };
    }
  }
}