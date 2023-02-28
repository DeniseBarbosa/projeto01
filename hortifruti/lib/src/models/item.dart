//pertence a seção imagens
class ModeloItem {
  String nomeItem;
  String imagem;
  String quantidade;
  double preco;
  String descricao;

  ModeloItem(
      {required this.descricao,
      required this.imagem,
      required this.nomeItem,
      required this.preco,
      required this.quantidade});
}
