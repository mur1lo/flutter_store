import 'package:flutter/material.dart';

class MensagemErro extends StatelessWidget {
  final String mensagem;
  final Color fundo;
  final Color cor;

  const MensagemErro({
    super.key,
    required this.mensagem,
    this.fundo = const Color(0xFFEF9A9A),
    this.cor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: fundo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        mensagem,
        style: TextStyle(
          color: cor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MensagemSucesso extends StatelessWidget {
  final String mensagem;
  final Color fundo;
  final Color cor;

  const MensagemSucesso({
    super.key,
    required this.mensagem,
    this.fundo = const Color(0xFFA5D6A7),
    this.cor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: fundo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        mensagem,
        style: TextStyle(
          color: cor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
