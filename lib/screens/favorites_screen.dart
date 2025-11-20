import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<int> favoriteIds;

  const FavoritesScreen({super.key, required this.favoriteIds});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Product> allProducts = [
    Product(
      id: 1,
      name: 'Smartphone X',
      description: 'Smartphone de última geração com câmera 48MP',
      price: 2499.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Smartphone+X',
      category: 'Eletrônicos',
    ),
    Product(
      id: 2,
      name: 'Fone de Ouvido Pro',
      description: 'Fone de ouvido wireless com cancelamento de ruído',
      price: 899.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Fone+de+Ouvido',
      category: 'Eletrônicos',
    ),
    Product(
      id: 3,
      name: 'Camiseta Premium',
      description: 'Camiseta de algodão 100% confortável',
      price: 79.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Camiseta',
      category: 'Roupas',
    ),
    Product(
      id: 4,
      name: 'Calça Jeans Clássica',
      description: 'Calça jeans azul escuro, modelo clássico',
      price: 129.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Calça+Jeans',
      category: 'Roupas',
    ),
    Product(
      id: 5,
      name: 'Flutter para Iniciantes',
      description: 'Livro completo sobre desenvolvimento em Flutter',
      price: 89.90,
      imageUrl: 'https://via.placeholder.com/300x300?text=Livro+Flutter',
      category: 'Livros',
    ),
    Product(
      id: 6,
      name: 'Dart Avançado',
      description: 'Guia completo de programação com Dart',
      price: 99.90,
      imageUrl: 'https://via.placeholder.com/300x300?text=Livro+Dart',
      category: 'Livros',
    ),
    Product(
      id: 7,
      name: 'Luminária LED',
      description: 'Luminária inteligente com ajuste de cores',
      price: 159.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Luminária',
      category: 'Casa',
    ),
    Product(
      id: 8,
      name: 'Almofada Confortável',
      description: 'Almofada de espuma com capa removível',
      price: 49.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Almofada',
      category: 'Casa',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = allProducts
        .where((product) => widget.favoriteIds.contains(product.id))
        .toList();

    if (favoriteProducts.isEmpty) {
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
      itemCount: favoriteProducts.length,
      itemBuilder: (context, index) {
        final product = favoriteProducts[index];

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductDetailScreen(
                  product: product,
                  isFavorite: true,
                  onFavoriteToggle: () {
                    setState(() {});
                  },
                ),
              ),
            );
          },
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
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          product.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'R\$ ${product.price.toStringAsFixed(2)}',
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
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
