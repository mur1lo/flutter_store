import 'package:flutter/material.dart';

class CartaoProduto extends StatelessWidget {
  final String nome;
  final String categoria;
  final double preco;
  final bool favorito;
  final VoidCallback aoClicar;
  final VoidCallback aoFavoritar;

  const CartaoProduto({
    super.key,
    required this.nome,
    required this.categoria,
    required this.preco,
    required this.favorito,
    required this.aoClicar,
    required this.aoFavoritar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoClicar,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 50,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoria,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'R\$ ${preco.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: aoFavoritar,
                child: Icon(
                  favorito ? Icons.favorite : Icons.favorite_outline,
                  color: favorito ? Colors.red : Colors.grey,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
