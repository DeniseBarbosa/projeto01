// essa class é referene ao perfil do usuario 

class UsuarioModel{
  String nome;
  String email;
  String senha;
  String celular;
  String cpf;

  UsuarioModel({
    required this.celular,
    required this.cpf,
    required this.email,
    required this.nome,
    required this.senha,

  });
}