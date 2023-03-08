import 'package:flutter/material.dart';
import 'package:hortifruti/src/pages/widgets/customizar_texto_campo.dart';
import 'package:hortifruti/src/config/app_dados.dart' as appDados;

class PerfilTab extends StatefulWidget {
  const PerfilTab({super.key});

  @override
  State<PerfilTab> createState() => _PerfilTabState();
}

class _PerfilTabState extends State<PerfilTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil do usuário"),
        //botão para sair da pagina
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      //cria o formulario
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //=> lembrando que se refere ao aquivo de customização de campo, q se encontra no arquivo
          //customizar_texto.dar na pasta widgets
          //Email
          CustomizarTextoCampo(
            apenasLeitura: true,
            valorInicial: appDados.usuario.email,
            icon: Icons.email,
            label: "Email",
          ),
          //Nome
          CustomizarTextoCampo(
            apenasLeitura: true,
            valorInicial: appDados.usuario.nome,
            icon: Icons.person,
            label: "Nome",
          ),
          //Celular
          CustomizarTextoCampo(
            apenasLeitura: true,
            valorInicial: appDados.usuario.celular,
            icon: Icons.phone,
            label: "Telefone",
          ),
          //CPF
          CustomizarTextoCampo(
            apenasLeitura: true,
            valorInicial: appDados.usuario.cpf,
            icon: Icons.file_copy,
            label: "CPF",
            esconderSenha: true,
          ),
          //Botão de atualização de senha
          //SizedBox => foi usado para aumentar o tamanho do botão
          SizedBox(
            height: 50,
            child: OutlinedButton(
              //estilizando o botão
              style: OutlinedButton.styleFrom(
                //deixa as bordas de cor laranja
                side: BorderSide(color: Colors.orange),
                //deixando as bordas do botão arredondado
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                //some um modal para atualizar a senha
                atualizarSenha();
              },
              child: Text("Atualizar senha"),
            ),
          ),
        ],
      ),
    );
  }

  //função para o botão de atualizar e será necessaria mudar o stateless para statefull
  Future<bool?> atualizarSenha() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          //deixa as bordas do modal arredondadas
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //Stack => foi usado para colocar o botão de fechar
          child: Stack(
            children: [
              Padding(
                //antes disso o conteudo ficava muito junto
                padding: const EdgeInsets.all(16),
                child: Column(
                  //deixa o botão do tamanho o conteudo
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //vai fazer que o crescimento no eixo vertical seja o minimo possivel
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      //vai dar um espaçmento no texto
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Atualização de senha",
                        //deixar o texto no centro
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomizarTextoCampo(
                      esconderSenha: true,
                      icon: Icons.lock,
                      label: "Senha atual",
                    ),
                    CustomizarTextoCampo(
                      esconderSenha: true,
                      icon: Icons.lock_outline,
                      label: "Nova Senha",
                    ),
                    CustomizarTextoCampo(
                      esconderSenha: true,
                      icon: Icons.lock_outline,
                      label: "Confirmar nova senha",
                    ),
                    //botão de confirmação
                    //SizedBox => foi necessario para deixar o botão mais alto
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        //arredondar o botão
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Atualizar"),
                      ),
                    ),
                  ],
                ),
              ),

              //botão de fechar
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
