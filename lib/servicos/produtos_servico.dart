import '../modelos/produto.dart';

class ProdutosServico {
  static final List<Produto> todosProdutos = [
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

  static List<Produto> obterTodosProdutos() => todosProdutos;
}
