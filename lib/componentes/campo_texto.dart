import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String dica;
  final IconData icone;
  final bool obscureText;
  final TextInputType tipoTeclado;

  const CampoTexto({
    super.key,
    required this.controller,
    required this.dica,
    required this.icone,
    this.obscureText = false,
    this.tipoTeclado = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: tipoTeclado,

      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey.shade600),
        hintText: dica,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(icone),
      ),
    );
  }
}
