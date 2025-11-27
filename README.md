# Flutter Store 🛍️

Aplicação de e-commerce desenvolvida em Flutter como projeto avaliativo de Desenvolvimento Mobile.

## 📱 Funcionalidades

- ✅ **Login e Cadastro** com validações
- ✅ **Catálogo de 8 Produtos** com categorias
- ✅ **Sistema de Favoritos** com persistência local
- ✅ **Tela de Detalhes** com informações completas
- ✅ **Navegação Fluida** com Drawer + Bottom Navigation
- ✅ **Splash Screen com Animação** (bônus)

## 🏗️ Estrutura do Projeto

```
lib/
├── main.dart              # Entrada da aplicação
├── modelos/              # Modelos de dados
│   ├── produto.dart
│   └── usuario.dart
├── componentes/          # Componentes reutilizáveis
│   ├── campo_texto.dart
│   ├── botao_principal.dart
│   ├── cartao_produto.dart
│   └── mensagens.dart
└── telas/                # Telas da aplicação
    ├── splash_tela.dart
    ├── login_tela.dart
    ├── cadastro_tela.dart
    ├── home_tela.dart
    ├── produtos_tela.dart
    ├── detalhe_produto_tela.dart
    ├── favoritos_tela.dart
    └── sobre_tela.dart
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (v3.9.2+)
- Dart SDK

### Passos

```bash
# 1. Entre no diretório do projeto
cd flutter_store

# 2. Instale as dependências
flutter pub get

# 3. Execute a aplicação
flutter run
```

## 🎨 Telas Implementadas

| Tela | Descrição |
|------|-----------|
| **Splash** | Animação de carregamento (3s) |
| **Login** | Autenticação com validação de e-mail |
| **Cadastro** | Criação de conta com validação de senhas |
| **Home** | Dashboard com categorias e promoções |
| **Produtos** | Lista completa de 8 produtos |
| **Detalhes** | Informações detalhadas do produto |
| **Favoritos** | Produtos marcados como favoritos |
| **Sobre** | Informações do app |

## 🛠️ Tecnologias

- **Flutter** - Framework UI
- **Dart** - Linguagem de programação
- **Material Design 3** - Design system
- **Cores SENAI SC** - Azul (#0052CC) e Branco

## 📝 

- Dados simulados, sem persistência permanente
- Sistema de favoritos funciona com `setState`
- Sem autenticação real (apenas validação de formulário)
- Interface responsiva e intuitiva

## 👨‍💻 Desenvolvedores

- Murilo da Silva
- Giulia Monte Blanco Happke
- Rafael Theodoro de Moraes
- Eliza Carla Valdiero
- Rafael Theodoro de Moraes
- Eliza Carla Valdiero


**Versão:** 1.0.0 | **Data:** 19 de Novembro de 2025
