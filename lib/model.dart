class Restaurante {
  String id;
  final String nome;
  final String descricao;
  final String urlLogo;
  final String corTema;

  Restaurante({
    this.id = '',
    required this.nome,
    required this.descricao,
    required this.urlLogo,
    required this.corTema,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'descricao': descricao,
        'url_logo': urlLogo,
        'cor_tema': corTema
      };

  static Restaurante fromJson(Map<String, dynamic> json) => Restaurante(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      urlLogo: json['url_logo'],
      corTema: json['cor_tema']);
}
