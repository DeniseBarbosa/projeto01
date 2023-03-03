import 'package:flutter/material.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';
import 'package:hortifruti/src/models/carrinho_lista.dart';
import 'package:hortifruti/src/pages/widgets/quantidade_widgets.dart';
import 'package:hortifruti/src/services/servicos_util.dart';

class CarrinhoTile extends StatefulWidget {
  final CarrinhoItem carrinhoItem;
  //faz parte da config de remcão do item
  final Function(CarrinhoItem) remova;

  CarrinhoTile({
    super.key,
    required this.carrinhoItem,
    //faz parte da config de remcão do item
    required this.remova,
  });

  @override
  State<CarrinhoTile> createState() => _CarrinhoTileState();
}

class _CarrinhoTileState extends State<CarrinhoTile> {
  //faz referencia ao R$
  final ServicosUtil servicosUtil = ServicosUtil();

  @override
  Widget build(BuildContext context) {
    return Card(
      //espaçamento itens
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      //arredondamento das caixinhas 3
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      // Por exemplo, imagine uma lista de contatos em um aplicativo de telefone. Cada
      // contato pode ser representado como um ListTile, com o nome do contato como texto,
      // uma foto como ícone e um botão para fazer uma ligação ou enviar uma mensagem.
      child: ListTile(
        //imagem
        leading: Image.asset(
          widget.carrinhoItem.item.imagem,
          height: 60,
          width: 60,
        ),
        //titulo
        title: Text(
          widget.carrinhoItem.item.nomeItem,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        //total
        subtitle: Text(
          servicosUtil.precoMoeda(widget.carrinhoItem.PrecoTotal()),
          style: TextStyle(
            color: CoresCustomizada.CorCustomizadaContraste,
            fontWeight: FontWeight.bold,
          ),
        ),
        //quantidade
        trailing: QuantidadeWidget(
          textosufixo: widget.carrinhoItem.item.quantidade,
          valor: widget.carrinhoItem.quantidade,
          resultado: (quantidade) {
            //faz parte da config do botão de remoção, nesse caso se tornara dinamico ao clicar - lembrando que tem que mudar o
            //..continua o stateless para statefull
            setState(() {
              widget.carrinhoItem.quantidade = quantidade;
              //remover item do carrinho
              if( quantidade == 0){
                  //remover 
                  widget.remova(widget.carrinhoItem);
              }
            });
          },
          //faz parte da config do botão de remoção
          eRemovivel: true,
        ),
      ),
    );
  }
}
