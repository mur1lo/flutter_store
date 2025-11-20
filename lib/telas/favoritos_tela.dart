import 'package:flutter/material.dart';
import '../modelos/produto.dart';
import 'detalhe_produto_tela.dart';
import '../componentes/cartao_produto.dart';

class FavoritosTela extends StatefulWidget {
  final List<int> idsDosFavoritos;

  const FavoritosTela({super.key, required this.idsDosFavoritos});

  @override
  State<FavoritosTela> createState() => _FavoritosTelaState();
}

class _FavoritosTelaState extends State<FavoritosTela> {
  final List<Produto> todosProdutos = [
    Produto(
      id: 1,
      nome: 'Smartphone X',
      descricao: 'Smartphone de última geração com câmera 48MP',
      preco: 2499.99,
      urlImagem: 'https://via.placeholder.com/300x300?text=Smartphone+X',
      categoria: 'Eletrônicos',
    ),
    Produto(
      id: 2,
      nome: 'Fone de Ouvido Pro',
      descricao: 'Fone de ouvido wireless com cancelamento de ruído',
      preco: 899.99,
      urlImagem: 'https://via.placeholder.com/300x300?text=Fone+de+Ouvido',
      categoria: 'Eletrônicos',
    ),
    Produto(
      id: 3,
      nome: 'Camiseta Premium',
      descricao: 'Camiseta de algodão 100% confortável',
      preco: 79.99,
      urlImagem: 'https://via.placeholder.com/300x300?text=Camiseta',
      categoria: 'Roupas',
    ),
    Produto(
      id: 4,
      nome: 'Calça Jeans Clássica',
      descricao: 'Calça jeans azul escuro, modelo clássico',
      preco: 129.99,
      urlImagem: 'https://via.placeholder.com/300x300?text=Calça+Jeans',
      categoria: 'Roupas',
    ),
    Produto(
      id: 5,
      nome: 'Flutter para Iniciantes',
      descricao: 'Livro completo sobre desenvolvimento em Flutter',
      preco: 89.90,
      urlImagem: 'https://via.placeholder.com/300x300?text=Livro+Flutter',
      categoria: 'Livros',
    ),
    Produto(
      id: 6,
      nome: 'Dart Avançado',
      descricao: 'Guia completo de programação com Dart',
      preco: 99.90,
      urlImagem: 'https://via.placeholder.com/300x300?text=Livro+Dart',
      categoria: 'Livros',
    ),
    Produto(
      id: 7,
      nome: 'Luminária LED',
      descricao: 'Luminária inteligente com ajuste de cores',
      preco: 159.99,
      urlImagem: 'https://via.placeholder.com/300x300?text=Luminária',
      categoria: 'Casa',
    ),
    Produto(
      id: 8,
      nome: 'Almofada Confortável',
      descricao: 'Almofada de espuma com capa removível',
      preco: 49.99,
      urlImagem: 'https://via.placeholder.com/300x300?text=Almofada',
      categoria: 'Casa',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final produtosFavoritos = todosProdutos
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
                    setState(() {});
                  },
                ),
              ),
            );
          },
          aoFavoritar: () {
            setState(() {});
          },
        );
      },
    );
  }
}
