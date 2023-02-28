import 'package:flutter/material.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';
import 'package:hortifruti/src/pages/home/components/items_fotos.dart';
import 'package:hortifruti/src/pages/home/components/titulo_categoria.dart';
////pertence a seção imagens
import 'package:hortifruti/src/config/app_dados.dart' as appDados;

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String CategoriaSelecionada = 'Sorvetes';

  List<String> categorias = [
    'Sorvetes',
    'Brigadeiros',
    'Donutes',
    'Paçoca',
    'Pudim',
  ];

  ///backgroundColor e elevation: 0, => nesse caso foi aplicado pq antes a cor de fundo era verde, aplicando os dois o fundo fica transparente mais sobriado com o elevation 0 essa sobra
  ///..continua some e o fundo fica transparente
  ///actions => botão de carrinho => Padding posicionar o carrinho => Badge é quando add ou removemos um item o carrinho ganha ou reduz uma numeracação
  ///..continua IconButton => chama fig do carrinho que ja vem no matirial nele podemos mudar a cor do icon
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: "Verde",
                style: TextStyle(color: Colors.green),
              ),
              TextSpan(
                text: "Limão",
                style:
                    TextStyle(color: CoresCustomizada.CorCustomizadaContraste),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: Badge(
              backgroundColor: Colors.red,
              label: Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  //muda a cor do icone
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
      //campo de pesquisa
      body: Column(
        children: [
          //modificar as magens do campo
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            //campo de texto e customizações
            child: TextFormField(
              decoration: InputDecoration(
                //reduz altura do campo
                isDense: true,
                //sem ele o campo some
                filled: true,
                //texto dentro do campo
                hintText: "Pesquisar aqui...",
                //customização do texto dentro do campo
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 236, 175, 82),
                  fontSize: 14,
                ),
                //icone dentro do campo e customizações
                prefixIcon: Icon(
                  Icons.search,
                  color: CoresCustomizada.CorCustomizadaContraste,
                  size: 21,
                ),
                //cor de fundo do campo
                fillColor: Colors.white,
                //deixar a borda do campo arredondada
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  //tira a borda e sombra do campo
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

          //categorias
          //a rolagem do itens vai ser na horizontal
          //arquivo titulo_categoria.dart
          Container(
            padding: EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return TituloCategoria(
                  //selecionada ao clicar lembrando que mude o stateless para statefull
                  clicado: () {
                    setState(() {
                      //pertence a seção imagens appDados.categorias
                      CategoriaSelecionada = appDados.categorias[index];
                    });
                  },
                  categoria: appDados.categorias[index],
                  estaSelecionado:
                      appDados.categorias[index] == CategoriaSelecionada,
                );
              },
              separatorBuilder: (_, index) => SizedBox(
                width: 10,
              ),
              itemCount: appDados.categorias.length,
            ),
          ),

          //grid fotos
          //pertence a seção imagens appDados.categorias
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: appDados.items.length,
              itemBuilder: (_, index) {
                //refere-se ao arq items_fotos
                return  CarFotos(
                  //ref arq app_dados e items_fotos
                  item : appDados.items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
