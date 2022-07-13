class NoticiaModel {
  final int? id;
  final String titulo;
  final String descricao;
  final String imagem;
  final String dataPublicacao;
  final String dataAtualizacao;

  NoticiaModel(
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.dataPublicacao,
    this.dataAtualizacao,
  );

  @override
  String toString() {
    return 'NoticiaModel(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, dataPublicacao: $dataPublicacao, dataAtualizacao: $dataAtualizacao)';
  }

  factory NoticiaModel.fromJson(Map<String, dynamic> map) {
    return NoticiaModel(
      map['id'] ?? 0,
      map['titulo'] ?? "",
      map['descricao'] ?? "",
      map['imagem'] ?? "",
      map['dataPublicacao'] ?? "",
      map['dataAtualizacao'] ?? "",
    );
  }

  NoticiaModel copyWith({
    int? id,
    String? titulo,
    String? descricao,
    String? imagem,
    String? dataPublicacao,
    String? dataAtualizacao,
  }) {
    return NoticiaModel(
      id ?? this.id,
      titulo ?? this.titulo,
      descricao ?? this.descricao,
      imagem ?? this.imagem,
      dataPublicacao ?? this.dataPublicacao,
      dataAtualizacao ?? this.dataAtualizacao,
    );
  }

  Map toJson() {
    return {
      "id": id,
      "titulo": titulo,
      "descricao": descricao,
      "imagem": imagem,
      "dataPublicacao": dataPublicacao,
      "dataAtualizacao": dataAtualizacao,
    };
  }
}
