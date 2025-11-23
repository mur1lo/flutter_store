import 'package:flutter/material.dart';
import 'login_tela.dart';

class SplashTela extends StatefulWidget {
  const SplashTela({super.key});

  @override
  State<SplashTela> createState() => _SplashTelaState();
}

class _SplashTelaState extends State<SplashTela>
    with SingleTickerProviderStateMixin {
  late AnimationController _animacaoController;
  late Animation<double> _escalaAnimacao;
  late Animation<double> _desvaneceAnimacao;

  @override
  void initState() {
    super.initState();

    _animacaoController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _escalaAnimacao = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animacaoController, curve: Curves.elasticOut),
    );

    _desvaneceAnimacao = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animacaoController, curve: Curves.easeIn),
    );

    _animacaoController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginTela()),
        (route) => false,
      );
    });
  }

  @override
  void dispose() {
    _animacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0052CC), Color(0xFF0080FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _escalaAnimacao,
                child: FadeTransition(
                  opacity: _desvaneceAnimacao,
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
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              FadeTransition(
                opacity: _desvaneceAnimacao,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0080FF)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
