class Livro {
  final String titulo;
  final List<String> autores;
  final int? anoPrimeiraPublicacao;
  final int quantidadeEdicoes;
  final List<String> idiomas;

  Livro({
    required this.titulo,
    required this.autores,
    this.anoPrimeiraPublicacao,
    required this.quantidadeEdicoes,
    required this.idiomas,
  });

  factory Livro.fromJson(Map<String, dynamic> json) {
    return Livro(
      titulo: json['title'] ?? 'Título desconhecido',
      autores: (json['author_name'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          ['Autor não informado'],
      anoPrimeiraPublicacao: json['first_publish_year'],
      quantidadeEdicoes: json['edition_count'] ?? 0,
      idiomas: (json['language'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          ['Idioma não informado'],
    );
  }
}