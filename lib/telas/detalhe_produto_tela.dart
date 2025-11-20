import 'package:flutter/material.dart';
import '../modelos/produto.dart';
import '../componentes/botao_principal.dart';

class DetalheProdutoTela extends StatefulWidget {
  final Produto produto;
  final bool ehFavorito;
  final Function() aoAlternarFavorito;

  const DetalheProdutoTela({
    super.key,
    required this.produto,
    required this.ehFavorito,
    required this.aoAlternarFavorito,
  });

  @override
  State<DetalheProdutoTela> createState() => _DetalheProdutoTelaState();
}

class _DetalheProdutoTelaState extends State<DetalheProdutoTela> {
  late bool _ehFavorito;

  @override
  void initState() {
    super.initState();
    _ehFavorito = widget.ehFavorito;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 150,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.produto.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.produto.categoria,
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _ehFavorito = !_ehFavorito;
                          });
                          widget.aoAlternarFavorito();
                        },
                        child: Icon(
                          _ehFavorito ? Icons.favorite : Icons.favorite_outline,
                          color: _ehFavorito ? Colors.red : Colors.grey,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'R\$ ${widget.produto.preco.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.produto.descricao,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  BotaoPrincipal(
                    texto: 'Adicionar ao Carrinho',
                    aoClicar: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${widget.produto.nome} adicionado ao carrinho!',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.deepPurple),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Voltar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
