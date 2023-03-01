import 'package:hortifruti/src/models/item.dart';

//pertence a seção imagens

ModeloItem donuts = ModeloItem(
  descricao: "Escreva algo aqui",
  imagem: "assets/images/donuts.png",
  nomeItem: "Donuts",
  preco: 5.6,
  quantidade: "Qtd",
);
ModeloItem bombons = ModeloItem(
  descricao: "Escreva algo aqui",
  imagem: 'assets/images/bombons.png',
  nomeItem: "Bombons",
  preco: 5.6,
  quantidade: "Qtd",
);
ModeloItem cheesecake = ModeloItem(
  descricao: "Escreva algo aqui",
  imagem: 'assets/images/cheesecake.png',
  nomeItem: "cheesecake",
  preco: 5.6,
  quantidade: "Qtd",
);
ModeloItem donut = ModeloItem(
  descricao: "Escreva algo aqui",
  imagem: 'assets/images/donut.png',
  nomeItem: "Donut",
  preco: 5.6,
  quantidade: "Qtd",
);
ModeloItem pudim = ModeloItem(
  descricao: "Escreva algo aqui",
  imagem: 'assets/images/pudim.png',
  nomeItem: "Pudim",
  preco: 5.6,
  quantidade: "Qtd",
);
ModeloItem sorvete = ModeloItem(
  descricao: "Escreva algo aqui",
  imagem: 'assets/images/sorvete.png',
  nomeItem: "Sorvete",
  preco: 5.6,
  quantidade: "Qtd",
);

List<ModeloItem> items = [
  donuts,
  donut,
  pudim,
  cheesecake,
  sorvete,
  bombons,
];

//faz parte dos itens que será apresentados que fica debaixo do campo
List<String> categorias = [
  'Sorvetes',
  'Brigadeiros',
  'Donutes',
  'Paçoca',
  'Pudim',
];
