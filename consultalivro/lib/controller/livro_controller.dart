import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/livro_model.dart';

class LivroController {
  Future<List<Livro>> buscarLivros(String termo) async {
    final urlFormatada = Uri.encodeComponent(termo);
    final url = Uri.parse('https://openlibrary.org/search.json?q=$urlFormatada');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final docs = data['docs'] as List<dynamic>?;

      if (docs == null || docs.isEmpty) return [];

      return docs.map((doc) => Livro.fromJson(doc)).toList();
    } else {
      throw Exception('Falha ao carregar livros da Open Library');
    }
  }
}