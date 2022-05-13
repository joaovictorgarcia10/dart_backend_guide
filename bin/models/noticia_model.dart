class NoticiaModel {
  final int id;
  final String titulo;
  final String descricao;
  final String imagem;
  final DateTime dataPublicacao;
  final DateTime? dataAtualizacao;

  NoticiaModel({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagem,
    required this.dataPublicacao,
    this.dataAtualizacao,
  });

  @override
  String toString() {
    return 'NoticiaModel(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, dataPublicacao: $dataPublicacao, dataAtualizacao: $dataAtualizacao)';
  }
}
