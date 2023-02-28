//esse aquivo faz parta da seção de itens com fotos em cascatas

import 'package:flutter/material.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';
import 'package:hortifruti/src/models/item.dart';
import 'package:hortifruti/src/services/servicos_util.dart';

class CarFotos extends StatelessWidget {
  final ModeloItem item;

  CarFotos({
    super.key,
    required this.item,
  });

  //preço R$
  final ServicosUtil servicosUteis = ServicosUtil();

  @override
  Widget build(BuildContext context) {
    //O stack será usado para colocar um botão superior direito no card
    return Stack(
      children: [
        Card(
          //sombriamento nas bordas
          elevation: 3,
          shadowColor: Colors.orange.shade300,
          //bordas circundadas
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Padding(
            //da um espaçamento das imgs em outras palavras deixam elas mais pequenas
            padding: const EdgeInsets.all(12),
            child: Column(
              //texto será enviado para a esquerda do card
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //imagens
                //vai reorganizar os textos e imgs
                Expanded(
                  child: Image.asset(item.imagem),
                ),
                //Nome
                Text(
                  item.nomeItem,
                  //textos maiores e em negritos
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Preço - quantidade
                //o row foi usado para colocar a unidade de medida do lado do texto no caso o numero
                //..continua ñ foi aplicado
                Row(
                  children: [
                    Text(
                      //R$
                      servicosUteis.precoMoeda(item.preco),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CoresCustomizada.CorCustomizadaContraste,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //Botão de add no carrinho
        Positioned(
          top: 4,
          right: 4,
          //deixar o botão clicavel
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CoresCustomizada.CorCustomizadaContraste,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
