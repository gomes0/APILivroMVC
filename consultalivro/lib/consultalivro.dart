import 'dart:io';
import '../controller/livro_controller.dart';

class LivroView {
  final LivroController _controller = LivroController();

  Future<void> iniciar() async {
    stdout.write('Digite o nome do livro ou autor: ');
    final termo = stdin.readLineSync();

    if (termo == null || termo.trim().isEmpty) {
      print('Busca cancelada.');
      return;
    }

    print('\nConsultando Open Library...\n');

    try {
      final livros = await _controller.buscarLivros(termo);

      if (livros.isEmpty) {
        print('Nenhum livro encontrado.');
        return;
      }

      print('--- RESULTADOS DA BUSCA ---');
      for (var i = 0; i < livros.length; i++) {
        final livro = livros[i];
        print('${i + 1}. Título: ${livro.titulo}');
        print('   Autor(es): ${livro.autores.join(', ')}');
        print('   Ano da primeira publicação: ${livro.anoPrimeiraPublicacao ?? 'Não informado'}');
        print('   Quantidade de edições: ${livro.quantidadeEdicoes}');
        print('   Idioma(s): ${livro.idiomas.join(', ')}');
        print('---------------------------');
      }
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }
}