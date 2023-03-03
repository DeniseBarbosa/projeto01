import 'package:flutter/material.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';

class QuantidadeWidget extends StatelessWidget {
  final int valor;
  final String textosufixo;
  final Function(int quantidade) resultado;
  //refe-se ao icone de lixeira remoção
  final bool eRemovivel;
  const QuantidadeWidget({
    super.key,
    required this.textosufixo,
    required this.valor,
    required this.resultado,
    //refe-se ao icone de lixeira remoção
    this.eRemovivel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade400,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //InkWell e Ink animação ao clicar no botão
          _BotaoQuantidade(
            //faz parte da config do botão de remover
            //caso n tiver um botão removivel ou o valor for maior que um apresentamos um icone remover, caso contrario outro botão!@#
            icon:
                !eRemovivel || valor > 1 ? Icons.remove : Icons.delete_forever,
            //se o botão n for removivel ou a quantidade maior do que 1 retorne cinza caso contrario retorne vermelho
            cor: !eRemovivel || valor > 1 ? Colors.grey : Colors.red,
            onPressed: () {
              //faz parte da config do botão de remoção  && !eRemovivel => retorna 0 caso clicar para menos q 1
              if (valor == 1 && !eRemovivel) return;
              int somaResultado = valor - 1;
              resultado(somaResultado);
            },
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$valor$textosufixo',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _BotaoQuantidade(
            icon: Icons.add,
            cor: CoresCustomizada.CorCustomizadaContraste,
            onPressed: () {
              int somaResultado = valor + 1;
              resultado(somaResultado);
            },
          ),
        ],
      ),
    );
  }
}

class _BotaoQuantidade extends StatelessWidget {
  final Color cor;
  final IconData icon;
  final VoidCallback onPressed;

  const _BotaoQuantidade({
    // super.key,
    required this.cor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: cor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
