import 'package:flutter/material.dart';
import '../modelos/produto.dart';
import '../servicos/produtos_servico.dart';
import 'detalhe_produto_tela.dart';
import '../componentes/cartao_produto.dart';

class FavoritosTela extends StatefulWidget {
  final List<int> idsDosFavoritos;

  const FavoritosTela({super.key, required this.idsDosFavoritos});

  @override
  State<FavoritosTela> createState() => _FavoritosTelaState();
}

class _FavoritosTelaState extends State<FavoritosTela> {
  @override
  Widget build(BuildContext context) {
    final produtosFavoritos = ProdutosServico.obterTodosProdutos()
        .where((produto) => widget.idsDosFavoritos.contains(produto.id))
        .toList();

    if (produtosFavoritos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            Text(
              'Nenhum produto favorito',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Adicione produtos aos favoritos para vê-los aqui',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: produtosFavoritos.length,
      itemBuilder: (context, index) {
        final produto = produtosFavoritos[index];

        return CartaoProduto(
          nome: produto.nome,
          categoria: produto.categoria,
          preco: produto.preco,
          favorito: true,
          aoClicar: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetalheProdutoTela(
                  produto: produto,
                  ehFavorito: true,
                  aoAlternarFavorito: () {
                    setState(() {
                      widget.idsDosFavoritos.remove(produto.id);
                    });
                  },
                ),
              ),
            );
          },
          aoFavoritar: () {
            setState(() {
              widget.idsDosFavoritos.remove(produto.id);
            });
          },
        );
      },
    );
  }
}
