//aqui fica a lista que vai referenciar a lista do carrinho
//pagina do arquiv pagina_carrinho.dart
import 'package:hortifruti/src/models/item.dart';

class CarrinhoItem {
  ModeloItem item;
  int quantidade;

  CarrinhoItem({
    required this.item,
    required this.quantidade,
  });

 double PrecoTotal() {
   return item.preco * quantidade;
  }
}
