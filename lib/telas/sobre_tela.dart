import 'package:flutter/material.dart';

class SobreTela extends StatelessWidget {
  const SobreTela({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0052CC), Color(0xFF0080FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Flutter Store',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Versão 1.0.0',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sobre',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0052CC),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'App de e-commerce desenvolvido em Flutter para demonstrar boas práticas de desenvolvimento mobile.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Funcionalidades',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0052CC),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _itemFuncao('Login e Cadastro', Icons.login),
                    _itemFuncao('8+ Produtos', Icons.shopping_bag),
                    _itemFuncao('Sistema de Favoritos', Icons.favorite),
                    _itemFuncao('Navegação Fluida', Icons.navigation),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _itemFuncao(String texto, IconData icone) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icone, color: Color(0xFF0052CC), size: 24),
          const SizedBox(width: 15),
          Text(
            texto,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
