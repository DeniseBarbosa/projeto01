import 'package:flutter/material.dart';
import 'package:hortifruti/src/pages/widgets/customizar_texto_campo.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelaCadastro extends StatelessWidget {
  TelaCadastro({super.key});

  //MaskTextInputFormatter
  ///É útil para criar campos de entrada de dados que requerem uma formatação específica,
  ///..continua => como números de telefone, CPF, CEP e outras informações que possuem um formato padrão.
  final FormatarCpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final NumeroFormatado = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    /// Column => Column é uma ferramenta útil para criar interfaces de usuário verticais e organizadas
    /// Expanded => Isso permite que o filho se expanda ou encolha para preencher o espaço disponível de maneira uniforme. Motivo da aplicação => Eu quero colocar o texto "Cadastro" no centro
    /// ..continuação => alem de usar o expanded é necessario envolver o widget Text com o widget Center para funcionar
    /// padding => foi aplicado um espaçamento tanto na direita, esquerda, topo ou baixo
    ///  decoration: BoxDecoration => usado para deixar as bordas arredondadas
    /// classe BoxDecoration => permitem personalizar a aparência do widget, como a cor de fundo, a borda, a sombra, o gradiente e a imagem de fundo
    /// CustomizarTextoCampo => referenciando o campos de texto customizado #vide components
    /// esconderSenha => referenciamento ao metodo que ja foi criado, #pagina login
    /// Envolvemos o ElevatedButton com o SizedBox para dar uma altura ao botão e utilizamos CrossAxisAlignment.stretch na coluna do formularios
    /// ..continua para deixar o botão na largura do conteudo dos compos de textos
    ///  style: ElevatedButton.styleFrom => deixa as bordas do botão arredondadas
    /// Barra de rolagem na pagina => body Colum envolver no wrap with widget => depois trocar por SingleChildScrollView
    /// ..continua  child: Column => envolver no SizedBox depois especifique a altura completa da tela => crie uma variavel depois do Scaffold
    /// ..continua variavel @ final size => depois acrescente no SizedBox => height: size.height, width: size.height,
    /// Botão de voltar => child: Column envolver em uma outra colum e trocar por stack => abaixo da colum coloque um IconButton
    /// ..continua envolva o IconButton  wrap with widget e troque por SafeArea => envolva Positioned #vai fazer que vc posicione o botão
    /// ..contiua em qualquer area da tela

    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: trocar plano de fundo aqui,

      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                          color: CoresCustomizada.CorCustomizadaContraste,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  //Formulario
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: BoxDecoration(
                      color: CoresCustomizada.CorCustomizadaContraste,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(45)),
                    ),

                    //children vai colocar tudo que o container vai ter dentro => conteudo!
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomizarTextoCampo(
                          icon: Icons.email,
                          label: 'Email',
                        ),
                        CustomizarTextoCampo(
                          icon: Icons.lock,
                          label: 'Senha',
                          esconderSenha: true,
                        ),
                        CustomizarTextoCampo(
                          icon: Icons.person,
                          label: 'Nome',
                        ),
                        CustomizarTextoCampo(
                          icon: Icons.phone,
                          label: 'Celular',
                          FormatarCampo: [NumeroFormatado],
                        ),
                        CustomizarTextoCampo(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          FormatarCampo: [FormatarCpf],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  18,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Cadastrar",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      //fecha a tela e volta para a tela de login
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: CoresCustomizada.CorCustomizadaContraste,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
