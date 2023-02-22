import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Text Form Field
class CustomizarTextoCampo extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool esconderSenha;
  //referente ao MaskTextInputFormatter vide tela de cadastro
  final List<TextInputFormatter>? FormatarCampo;

  const CustomizarTextoCampo({
    super.key,
    required this.icon,
    required this.label,
    this.esconderSenha = false,
    this.FormatarCampo,
  });

  @override
  State<CustomizarTextoCampo> createState() => _CustomizarTextoCampoState();
}

class _CustomizarTextoCampoState extends State<CustomizarTextoCampo> {
  bool esconder = false;

  @override
  void initState() {
    super.initState();
    esconder = widget.esconderSenha;
  }

  @override
  Widget build(BuildContext context) {
    ///O Padding foi usado para dar um espaçamento entre os campos de texto
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        inputFormatters: widget.FormatarCampo,
        obscureText: esconder, //deixa a senha oculta
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.esconderSenha
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      esconder = !esconder;
                    });
                  },
                  icon:
                      Icon(esconder ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
