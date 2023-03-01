import 'package:flutter/material.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';

class QuantidadeWidget extends StatelessWidget {
  final int valor;
  final String textosufixo;
  final Function(int quantidade) resultado;
  const QuantidadeWidget({
    super.key,
    required this.textosufixo,
    required this.valor,
    required this.resultado,
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
        children: [
          //InkWell e Ink animação ao clicar no botão
          _BotaoQuantidade(
            icon: Icons.remove,
            cor: Colors.grey,
            onPressed: () {
              if (valor == 1) return; 
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
