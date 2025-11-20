import 'package:flutter/material.dart';
import '../modelos/produto.dart';
import 'detalhe_produto_tela.dart';
import '../componentes/cartao_produto.dart';

class ProdutosTela extends StatefulWidget {
  final List<int> favoritos;
  final Function(int) aoAlternarFavorito;

  const ProdutosTela({
    super.key,
    required this.favoritos,
    required this.aoAlternarFavorito,
  });

  @override
  State<ProdutosTela> createState() => _ProdutosTelaState();
}

class _ProdutosTelaState extends State<ProdutosTela> {
  final List<Produto> produtos = [
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
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        final produto = produtos[index];
        final ehFavorito = widget.favoritos.contains(produto.id);

        return CartaoProduto(
          nome: produto.nome,
          categoria: produto.categoria,
          preco: produto.preco,
          favorito: ehFavorito,
          aoClicar: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetalheProdutoTela(
                  produto: produto,
                  ehFavorito: ehFavorito,
                  aoAlternarFavorito: () {
                    widget.aoAlternarFavorito(produto.id);
                  },
                ),
              ),
            );
          },
          aoFavoritar: () {
            widget.aoAlternarFavorito(produto.id);
            setState(() {});
          },
        );
      },
    );
  }
}
