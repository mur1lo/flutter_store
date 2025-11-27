import 'package:flutter/material.dart';
import 'cadastro_tela.dart';
import 'home_tela.dart';
import '../componentes/campo_texto.dart';
import '../componentes/botao_principal.dart';
import '../componentes/mensagens.dart';
import '../constantes/labels.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({super.key});

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  String _mensagemErro = '';

  void _entrar() {
    if (_emailController.text.isEmpty || _senhaController.text.isEmpty) {
      setState(() {
        _mensagemErro = Labels.preencherTodos;
      });
      return;
    }

    if (!_emailController.text.contains('@')) {
      setState(() {
        _mensagemErro = Labels.emailInvalido;
      });
      return;
    }

    setState(() {
      _mensagemErro = '';
    });

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => HomeTela(nomUsuario: _emailController.text)),
      (route) => false,
    );
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    Labels.appTitle,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CampoTexto(
                    controller: _emailController,
                    dica: Labels.email,
                    icone: Icons.email,
                    tipoTeclado: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  CampoTexto(
                    controller: _senhaController,
                    dica: Labels.senha,
                    icone: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  if (_mensagemErro.isNotEmpty)
                    MensagemErro(mensagem: _mensagemErro),
                  const SizedBox(height: 30),
                  BotaoPrincipal(
                    texto: Labels.entrar,
                    aoClicar: _entrar,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        Labels.naoTemConta,
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const CadastroTela()),
                          );
                        },
                        child: const Text(
                          Labels.criarConta,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }
}
