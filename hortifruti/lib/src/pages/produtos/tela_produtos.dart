import 'package:flutter/material.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';
import 'package:hortifruti/src/models/item.dart';
import 'package:hortifruti/src/pages/widgets/quantidade_widgets.dart';
import 'package:hortifruti/src/services/servicos_util.dart';

//antes era stateless e depois mudou para stateful porque existe um botão de quantidade que muda ao clicar em + ou -
class TelaProdutos extends StatefulWidget {
  TelaProdutos({
    super.key,
    //cod36
    required this.item,
  });

  //faz parte para chamar a img cod36
  final ModeloItem item;

  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  //referente a formataçã do valor R$
  final ServicosUtil servicosUtil = ServicosUtil();

  //refe-se ao arquivo quantidade_widgets
  int cardItemQuantidade = 1;

  ///Detalhes do produto
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //muda a cor de fundo da pagina
      backgroundColor: Colors.white.withAlpha(230),
      // Stack => ação necessaria para criar o botão de voltar
      body: Stack(
        children: [
          //conteudo
          Column(
            //refere-se a chamada da img detalhes produtos cod36
            children: [
              Expanded(
                // Hero e Tag => usado para animação de imgs
                child: Hero(
                  tag: widget.item.imagem,
                  child: Image.asset(widget.item.imagem),
                ),
              ),
              //fazer uma divisão na tela => cortar a tela ao meio, img para cima, conteudo baixo
              Expanded(
                child: Container(
                  //ação necessaria para todos os lados receber 32 e ao salvar o nome vai mais para o centro
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //circuferencia na borda superior
                    borderRadius: BorderRadius.vertical(
                      //superior
                      top: Radius.circular(
                        50,
                      ),
                    ),
                    //sombra na borda
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.shade600,
                        //itensifica a sombra na borda
                        offset: Offset(
                          0,
                          2,
                        ),
                      ),
                    ],
                  ),
                  //itens um a baixo do outro
                  child: Column(
                    //expande o conteudo
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //nome do doce - quantidade
                    children: [
                      //customização e chamando o nome do doce
                      //row colocar conteudo ao lado do outro
                      Row(
                        children: [
                          // Expanded => ação necessaria para conteudo quantidade para o lado esquerdo
                          Expanded(
                            child: Text(
                              widget.item.nomeItem,
                              maxLines: 2,
                              //quantidade max de linha em relação ao produto
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantidadeWidget(
                            //refere-se ao aquivo quantidade_widgets
                            textosufixo: widget.item.quantidade,
                            valor: cardItemQuantidade,
                            resultado: ((quantidade) {
                              setState(() {
                                cardItemQuantidade = quantidade;
                              });
                            }),
                          ),
                        ],
                      ),

                      //preço
                      //para que o text apresente o preço precisamos instaciar uma classe Serviçosuteis final ServicosUtil ...
                      //R$
                      Text(
                        servicosUtil.precoMoeda(widget.item.preco),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: CoresCustomizada.CorCustomizadaContraste,
                        ),
                      ),

                      //descrição
                      // SingleChildScrollView => ação necessaria caso o texto for grande, nesse caso vai existir uma barra de rolagem
                      //Expanded => ação necessaria para empurrar o botão para baixo, quando o texto for grande e com a necessidade de rolagem de conteudo
                      Expanded(
                        //ação necessaria para o texto dar um espaçamento ou respiro no topo e embaixo botão
                        child: Padding(
                          //ação necessaria para o texto dar um espaçamento ou respiro no topo e embaixo botão
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.descricao * 1000,
                              style: TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //botão
                      //SizedBox => para aumentar a altura do botão
                      SizedBox(
                        //SizedBox => para aumentar a altura do botão
                        height: 55,
                        //ElevatedButton.icon => pq terá um icon dentro do carrinho
                        child: ElevatedButton.icon(
                          //deixar as bordas arredondadas
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          label: Text(
                            "Add ao carrinho",
                            style: TextStyle(
                              fontSize: 18,
                              //Nota => mesmo colocando um peso no texto a diferença com ou sem é minuscula
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //icon carrinho dentro do botão e mudando a cor do carrinho (cor do carrinho ñ foi aplicada pq por default ja vem branco)
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            //color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //botão de voltar => lembre-se só é possivel devido ao Stack de cima
          //SafeArea => ação necessaria para que o botão fique em area visivel é importante ter, apresentado apenas na area visivel
          Positioned(
            //ação necessaria para mover o btão
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                //ação necessaria que fecha a tela e volta para a tela onde apresenta todos os produtos
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
