import 'package:intl/intl.dart';
class ServicosUtil{
  //R$ valor
  //essa classe serve para colocar a unidade de valor nos numeros no caso o Rel => ex: R$45,60
  String precoMoeda(double preco){
     
     NumberFormat numeroFormatado = NumberFormat.simpleCurrency(locale: 'pt_BR');

     return numeroFormatado.format(preco);

  }
}