import 'package:flutter/material.dart';

class BotaoPrincipal extends StatelessWidget {
  final String texto;
  final VoidCallback aoClicar;
  final Color fundo;
  final Color textoCor;

  const BotaoPrincipal({
    super.key,
    required this.texto,
    required this.aoClicar,
    this.fundo = Colors.blue,
    this.textoCor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: aoClicar,
        style: ElevatedButton.styleFrom(
          backgroundColor: fundo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textoCor,
          ),
        ),
      ),
    );
  }
}
