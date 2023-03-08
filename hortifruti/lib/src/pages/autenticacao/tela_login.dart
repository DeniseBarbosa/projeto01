import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hortifruti/src/pages/widgets/customizar_texto_campo.dart';
import 'package:hortifruti/src/pages/autenticacao/tela_cadastro.dart';
import 'package:hortifruti/src/pages/base/tela_base.dart';
import 'package:hortifruti/src/config/cor_customizada.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Nome do App
          ///#Lembrando que todas as vezes que queros deixar um conteudo em baixo do outro usamos a Column
          /// mainAxisAlignment => coloca os textos no centro
          /// Text.rich => e seus respectivos dãao uma estilização no texto
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                    ),
                    children: [
                      TextSpan(
                        text: "Verde",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Limão",
                        style: TextStyle(
                            color: CoresCustomizada.CorCustomizadaContraste),
                      ),
                    ],
                  ),
                ),

                //Categorias
                /// DefaultTextStyle incluindo  style: TextStyle ele estiliza todos os textos dentro da lista
                /// repeatForever => sem ela a animação para de exibir na tela em um determinado momento
                /// SizedBox => nesse caso é importante, porque sem ele quando a animação é gerada o texto "VerdeLimão" é movido para cima
                /// pause => sem ele, a animação aparece de forma lenta dando um intervalo de uma para a outra, quando é aplicado essa demora é eliminada
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    child: AnimatedTextKit(
                      pause: Duration.zero,
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText("Brigadeiro"),
                        FadeAnimatedText("donuts"),
                        FadeAnimatedText("Paçoca"),
                        FadeAnimatedText("Pudim"),
                        FadeAnimatedText("brownies"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Formulario
          /// Tratamento de overflow => antes aqui era um Expanded, contudo, foi feito a remoção para ficar com apenas Container
          /// isso possibilitou que o expanded de cima entenda que o nosso container debaixo precisa se expandir
          /// conforme o conteudo vai crescendo, dessa forma evitando o overflow => essa foi uma explicação rasa
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 40,
            ),
            decoration: BoxDecoration(
              color: CoresCustomizada.CorCustomizadaContraste,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              ),
            ),
            child: Column(
              ///uma explicação raza sobre crossAxisAlignment, ele foi aplicado para dar um efeito no
              /// botão "Entrar", ou seja, vai deixar a mesma largura do botão igual a largura dos campos
              /// de texto.
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Email
                CustomizarTextoCampo(
                  icon: Icons.email,
                  label: "Email",
                ),

                //Senha
                CustomizarTextoCampo(
                  icon: Icons.lock,
                  label: "Senha",
                  esconderSenha: true,
                ),

                //Entrar
                ///SizedBox trás a oportunidade de definir uma altura e uma largura no botão
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    /// Bordas do botão "Entrar" arredondadas =>  ElevatedButton.styleFrom
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      //veja as informações sobre pushReplacement no arquivo .txt
                      //rota que faz referencia a pagina Tabela Base
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (c) {
                        return TelaBase();
                      }));
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                //Esqueceu a senha
                /// Align => foi usado para posicionar o texto "Esqueceu a senha?" para a direita
                /// dessa forma vc pode usar esse recurso para ter outras posições de sua
                /// preferencia
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                //Divisor
                /// Row => quando eu quero colocar dois elementos ao lado do outro no horizontal
                /// Divider => traçar uma linha
                /// Expanded => largura pré-definida #sem ele o traço não aparece
                /// Padding => vai espaçar as duas linhas do "OU" # --- ou --- e afastar ou empurrar o botão "criar conta" para baixo
                /// Padding => atenção possibilidade de Overflow #erro
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("OU"),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                //Criar conta
                ///  side: const BorderSide => customizar a borda
                /// SizedBox => posibilita customizar largura e altura do botão #fica a dica!!
                ///  shape: RoundedRectangleBorder => bordas arredondadas
                ///  Navigator.push() => O Navigator é um widget do Flutter que permite a navegação entre diferentes telas (rotas)
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) {
                          return TelaCadastro();
                        }),
                      );
                    },
                    child: const Text(
                      "Criar conta",
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
}
