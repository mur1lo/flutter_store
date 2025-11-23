import 'package:flutter/material.dart';
import 'produtos_tela.dart';
import 'favoritos_tela.dart';
import 'sobre_tela.dart';
import 'login_tela.dart';

class HomeTela extends StatefulWidget {
  final String nomUsuario;

  const HomeTela({super.key, required this.nomUsuario});

  @override
  State<HomeTela> createState() => _HomeTelaState();
}

class _HomeTelaState extends State<HomeTela> {
  int _indiceAbaSelecionada = 0;
  final List<int> _favoritos = [];

  late List<Widget> _paginas;

  @override
  void initState() {
    super.initState();
    _paginas = [
      _construirHome(),
      ProdutosTela(
        favoritos: _favoritos,
        aoAlternarFavorito: (idProduto) {
          setState(() {
            if (_favoritos.contains(idProduto)) {
              _favoritos.remove(idProduto);
            } else {
              _favoritos.add(idProduto);
            }
          });
        },
      ),
      FavoritosTela(idsDosFavoritos: _favoritos),
      const SobreTela(),
    ];
  }

  Widget _construirHome() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0052CC), Color(0xFF0080FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.shopping_bag,
                  size: 80,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  'Bem-vindo, ${widget.nomUsuario}!',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Aproveite as melhores ofertas',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _cartaoCategoria('Eletrônicos', Icons.devices),
                      _cartaoCategoria('Roupas', Icons.shopping_bag),
                      _cartaoCategoria('Livros', Icons.book),
                      _cartaoCategoria('Casa', Icons.home),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF0080FF).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_offer, color: Color(0xFF0080FF), size: 30),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Promoção',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Até 50% de desconto!',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartaoCategoria(String titulo, IconData icone) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 90,
      decoration: BoxDecoration(
        color: Color(0xFF0052CC).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icone, size: 40, color: Color(0xFF0052CC)),
          const SizedBox(height: 8),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _aoAlternaTela(int indice) {
    setState(() {
      _indiceAbaSelecionada = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Store'),
          backgroundColor: const Color(0xFF0052CC),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0052CC), Color(0xFF0080FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Color(0xFF0052CC), size: 30),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.nomUsuario,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Início'),
                onTap: () {
                  _aoAlternaTela(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: const Text('Produtos'),
                onTap: () {
                  _aoAlternaTela(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favoritos'),
                onTap: () {
                  _aoAlternaTela(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Sobre'),
                onTap: () {
                  _aoAlternaTela(3);
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginTela()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
        body: _paginas[_indiceAbaSelecionada],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _indiceAbaSelecionada,
          selectedItemColor: const Color(0xFF0052CC),
          unselectedItemColor: Colors.grey,
          onTap: _aoAlternaTela,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Sobre',
            ),
          ],
        ),
      ),
    );
  }
}
