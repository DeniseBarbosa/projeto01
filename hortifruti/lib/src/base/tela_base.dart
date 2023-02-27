import 'package:flutter/material.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';

class TelaBase extends StatefulWidget {
  TelaBase({super.key});

  @override
  State<TelaBase> createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase> {
  ///bottomNavigationBar => será criado barra de navegação #siga as etapas conforme abaixo
  ///BottomNavigationBarType.fixed => significa que a barra de navegação terá uma quantidade fixa de itens e eles serão exibidos sempre na mesma ordem e posição
  ///..continua sem ele os icons não aparece ou a cor ficara invisivel
  ///PageView => visualização paginada, colocando todas as telas que serão apresentadas no aplicativo, vai se trasnformar em uma barra de rolagem horizontal
  ///..continua PageView é um widget em Flutter que permite exibir várias páginas de conteúdo em uma única tela. Ele é muito útil quando se deseja permitir que os usuários deslizem horizontalmente entre diferentes telas ou visualizações
  ///se atente ao currentIndex => onTap => setState =>int selecionadoIcon = 0; $finalidade => ao clicar no icone ele é selecionado
  /// MudarTela => Muda a tela conforme clica no incone
  /// physics => Evitar que o usuario faça a navegação puxando a tela de um lado para o outro, serar feio um travamento de tela a navegação só serar permitida clicando no icone

  int selecionadoIcon = 0;
  final MudarTela = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: MudarTela,
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.amber,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selecionadoIcon,
          onTap: (index) {
            //nesse caso especifico foi necessario mudar o Stateless para Stateful
            setState(() {
              selecionadoIcon = index;
              MudarTela.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: CoresCustomizada.CorCustomizadaContraste,
          //cor do icons
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.green.withAlpha(250),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Carrinho",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Pedidos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Perfil",
            ),
          ]),
    );
  }
}
