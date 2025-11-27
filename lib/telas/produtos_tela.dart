import 'dart:developer';

import 'package:flutter/material.dart';
import '../modelos/produto.dart';
import 'detalhe_produto_tela.dart';
import '../componentes/cartao_produto.dart';
import '../servicos/produtos_servico.dart';

class ProdutosTela extends StatefulWidget {
  final List<int> favoritos;
  final Function(int) aoAlternarFavorito;
  final String categoriaSelecionada;

  const ProdutosTela({
    super.key,
    required this.favoritos,
    required this.categoriaSelecionada,
    required this.aoAlternarFavorito,
  });

  @override
  State<ProdutosTela> createState() => _ProdutosTelaState();
}

class _ProdutosTelaState extends State<ProdutosTela> {
  List<Produto> _getProdutosFiltrados() {
    final produtos = ProdutosServico.obterTodosProdutos();
    if (widget.categoriaSelecionada.isEmpty) {
      return produtos;
    }
    return produtos
        .where((p) => p.categoria == widget.categoriaSelecionada)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final produtosFiltrados = _getProdutosFiltrados();

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: produtosFiltrados.length,
      itemBuilder: (context, index) {
        final produto = produtosFiltrados[index];
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
