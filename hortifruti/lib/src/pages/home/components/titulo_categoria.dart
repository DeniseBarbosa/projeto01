import 'package:flutter/material.dart';

class TituloCategoria extends StatelessWidget {
  const TituloCategoria({
    super.key,
    required this.categoria,
    required this.estaSelecionado,
    required this.clicado,
  });

  final String categoria;
  final bool estaSelecionado;
  //faz parte que quando clicar no item ele será selecionado
  final VoidCallback clicado;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //ciclou no intem fica selecionado
      onTap: clicado,
      child: Align(
        //texto botões itens fica no centro
        alignment: Alignment.center,
        child: Container(
          //posiciona os botões itens
          padding: EdgeInsets.symmetric(horizontal: 6),
          //coloca uma cor no fundo do itens
          decoration: BoxDecoration(
            //bordas nos botões itens
            borderRadius: BorderRadius.circular(10),
            // se estiver selecionado ao clicar no botão será verde caso contrario transparente
            color: estaSelecionado ? Colors.green : Colors.transparent,
          ),
          //so lebrando que ele pega a lista de string que esta em categorias no arquivo home.dart cod 56
          child: Text(
            categoria,
            //customizando o texto
            //se o texto (estaSelecionado) esta selecionado será branco caso contrario será laranja
            style: TextStyle(
              color: estaSelecionado ? Colors.white : Colors.orange,
              fontWeight: FontWeight.bold,
              //aumentar e diminuir o botão caso estiver selecionado
              //se o botão estiver selecionado seu tamanho será 16 caso contrario sera 14
              fontSize: estaSelecionado ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
