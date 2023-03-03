import 'package:flutter/material.dart';
import 'package:hortifruti/src/carrinho/components/carrinho_tile.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';
import 'package:hortifruti/src/models/carrinho_lista.dart';
import 'package:hortifruti/src/services/servicos_util.dart';
//foi aplicado por causa da lista do carrinho que esta no arquivo app_dados.dart
import 'package:hortifruti/src/config/app_dados.dart' as appDados;

class Carrinho extends StatefulWidget {
  Carrinho({super.key});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  final ServicosUtil servicosUtil = ServicosUtil();

  //faz parte da cofig de remoção do item troque o stateless para statefull
  void removerItemCarrinho(CarrinhoItem carrinhoItem) {
    setState(() {
      appDados.carrinhoItem.remove(carrinhoItem);
    });
  }

  double carrinhoPrecoTotal() {
    double total = 0;
    for (var item in appDados.carrinhoItem) {
      total += item.PrecoTotal();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoresCustomizada.CorCustomizadaContraste,
        title: Text("Carrinho"),
      ),
      //primeira caixa
      body: Column(
        children: [
          Expanded(
            //faz referencia a lista criada arquivos app_dados.dart e carrinho_lista.dart
            child: ListView.builder(
              itemCount: appDados.carrinhoItem.length,
              itemBuilder: (_, index) {
                //arquivo carrinho_tile
                return CarrinhoTile(
                  carrinhoItem: appDados.carrinhoItem[index],
                  //faz parte da cofig remoção item
                  remova: removerItemCarrinho,
                );
              },
            ),
          ),

          //refe-se a segunda caixa
          Container(
            //obs: a principio o texto fica bem no topo do container (caixa) quando é aplicado
            //..continua ele se organiza ficando dentro com um suspiro para esquerda e top
            padding: EdgeInsets.all(
              16,
            ),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              //arredonda a borda na parte de cima
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              //sombra na borda
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              //vai expandir a caixa
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Total a pagar",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  //refe-se ao arquivo servicos_uteis
                  //carrinhoPrecoTotal refe-se cconforme o valor do item é o valor total, essa função esta nesse mesmo arquivo
                  servicosUtil.precoMoeda(carrinhoPrecoTotal()),
                  //customizar o texto,lagura e em negrito
                  style: TextStyle(
                    fontSize: 23,
                    color: CoresCustomizada.CorCustomizadaContraste,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //SizedBox => é aplicado para dar uma altura ao botão
                SizedBox(
                  height: 50,
                  //botão
                  child: ElevatedButton(
                    //arredondar as bordas do botão
                    style: ElevatedButton.styleFrom(
                      //mudar a cor do botão
                      backgroundColor: CoresCustomizada.CorCustomizadaContraste,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      //modal de confirmação de pedido - ao clicar aparece um pop up de aviso de confirmação

                      bool? resultado = await mostrarConfirmacaoItem();
                      print(resultado);
                    },
                    child: Text(
                      "Concluir pedido",
                      //customiza o texto
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //pop up de quando o usuario clicar em concluir pedido surgi um tela perguntando se ele tem
  //..continua certeza da confirmação do pedido
  Future<bool?> mostrarConfirmacaoItem() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text("Confirmação"),
          content: Text("Deseja realmente concluir o pedido"),
          actions: [
            TextButton(
              onPressed: () {
                //fechar o botão
                Navigator.of(context).pop(false);
              },
              child: Text("Não"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                //fechar o botão e confirmar
                Navigator.of(context).pop(true);
              },
              child: Text("Sim"),
            ),
          ],
        );
      },
    );
  }
}
