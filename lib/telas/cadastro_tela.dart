import 'package:flutter/material.dart';
import 'login_tela.dart';
import '../componentes/campo_texto.dart';
import '../componentes/botao_principal.dart';
import '../componentes/mensagens.dart';

class CadastroTela extends StatefulWidget {
  const CadastroTela({super.key});

  @override
  State<CadastroTela> createState() => _CadastroTelaState();
}

class _CadastroTelaState extends State<CadastroTela> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  String _mensagemErro = '';
  String _mensagemSucesso = '';

  void _criarConta() {
    if (_nomeController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _senhaController.text.isEmpty ||
        _confirmarSenhaController.text.isEmpty) {
      setState(() {
        _mensagemErro = 'Por favor, preencha todos os campos!';
        _mensagemSucesso = '';
      });
      return;
    }

    if (_senhaController.text != _confirmarSenhaController.text) {
      setState(() {
        _mensagemErro = 'As senhas não conferem!';
        _mensagemSucesso = '';
      });
      return;
    }

    if (_senhaController.text.length < 6) {
      setState(() {
        _mensagemErro = 'A senha deve ter no mínimo 6 caracteres!';
        _mensagemSucesso = '';
      });
      return;
    }

    setState(() {
      _mensagemErro = '';
      _mensagemSucesso = 'Conta criada com sucesso! Voltando ao login...';
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginTela()),
        (route) => false,
      );
    });
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                child: Icon(
                  Icons.person_add,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Criar Conta',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    CampoTexto(
                      controller: _nomeController,
                      dica: 'Nome Completo',
                      icone: Icons.person,
                    ),
                    const SizedBox(height: 15),
                    CampoTexto(
                      controller: _emailController,
                      dica: 'E-mail',
                      icone: Icons.email,
                      tipoTeclado: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    CampoTexto(
                      controller: _senhaController,
                      dica: 'Senha',
                      icone: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    CampoTexto(
                      controller: _confirmarSenhaController,
                      dica: 'Confirmar Senha',
                      icone: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    if (_mensagemErro.isNotEmpty)
                      MensagemErro(mensagem: _mensagemErro),
                    if (_mensagemSucesso.isNotEmpty)
                      MensagemSucesso(mensagem: _mensagemSucesso),
                    const SizedBox(height: 30),
                    BotaoPrincipal(
                      texto: 'Criar Conta',
                      aoClicar: _criarConta,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Voltar ao Login',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }
}
