# Flutter Store - Aplicação de E-commerce

## 📱 Sobre o Projeto

A **Flutter Store** é uma aplicação mobile de e-commerce desenvolvida em Flutter como trabalho avaliativo para a disciplina de Desenvolvimento Mobile. O projeto demonstra os principais conceitos de desenvolvimento Flutter, incluindo navegação, gerenciamento de estado, widgets e componentes de interface.

## ✨ Funcionalidades Implementadas

### ✅ Tela de Login
- ✓ Campos de E-mail e Senha
- ✓ Validação visual com mensagens de erro
- ✓ Link para página de cadastro
- ✓ Redirecionamento para Home após login bem-sucedido

### ✅ Tela de Cadastro
- ✓ Campos: Nome, E-mail, Senha, Confirmar Senha
- ✓ Validação de campos vazios
- ✓ Validação se senhas são iguais
- ✓ Validação de comprimento mínimo de senha (6 caracteres)
- ✓ Redirecionamento para Login com mensagem de sucesso

### ✅ Tela Inicial (Home)
- ✓ AppBar com nome do aplicativo
- ✓ Drawer com menu de navegação
- ✓ Seção de bem-vindo personalizada
- ✓ Categorias populares
- ✓ Destaques e promoções
- ✓ Bottom Navigation Bar funcional

### ✅ Tela de Produtos
- ✓ Lista de 8 produtos simulados
- ✓ Cada item exibe: imagem, nome, preço, categoria
- ✓ Ícone de favoritar/desfavoritar
- ✓ ListView com navegação para detalhes
- ✓ Atualização automática de estado de favoritos

### ✅ Tela de Detalhes do Produto
- ✓ Exibição de imagem do produto
- ✓ Nome, categoria, preço, descrição
- ✓ Botão de favoritar/desfavoritar
- ✓ Botão "Adicionar ao Carrinho" com feedback
- ✓ Botão de voltar

### ✅ Tela "Meus Produtos" (Favoritos)
- ✓ Exibe apenas produtos marcados como favoritos
- ✓ Atualização automática conforme produtos são favoritados
- ✓ Mensagem quando nenhum produto está favoritado
- ✓ Navegação para detalhes funcionando

### ✅ Tela "Sobre"
- ✓ Informações sobre o aplicativo
- ✓ Lista de funcionalidades implementadas
- ✓ Tecnologias utilizadas
- ✓ Informações do desenvolvedor
- ✓ Dados de contato
- ✓ Design atrativo com ícones e cards

### ✅ Splash Screen (Bônus)
- ✓ Animação de scale com curva elástica
- ✓ Animação de fade-in
- ✓ Transição suave para tela de login
- ✓ Duração de 3 segundos

## 🏗️ Estrutura do Projeto

```
lib/
├── main.dart                           # Arquivo principal da aplicação
├── models/
│   ├── product.dart                   # Modelo de Produto
│   └── user.dart                      # Modelo de Usuário
└── screens/
    ├── splash_screen.dart             # Tela de Splash (com animação)
    ├── login_screen.dart              # Tela de Login
    ├── signup_screen.dart             # Tela de Cadastro
    ├── home_screen.dart               # Tela Inicial
    ├── products_screen.dart           # Tela de Produtos
    ├── product_detail_screen.dart     # Tela de Detalhes
    ├── favorites_screen.dart          # Tela de Favoritos
    └── about_screen.dart              # Tela Sobre
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK instalado (versão 3.9.2 ou superior)
- Dart SDK instalado
- Editor de código (VS Code, Android Studio, etc.)

### Passos para Executar

1. **Clone ou baixe o repositório**
```bash
cd /Users/murilodasilva/senai/mobile/flutter_store
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute o aplicativo**
```bash
flutter run
```

4. **Para executar em um dispositivo/emulador específico**
```bash
flutter run -d <device_id>
```

## 📦 Widgets Utilizados

- **Container**: Para criar containers com decorações e layouts
- **Row**: Para organizar elementos horizontalmente
- **Column**: Para organizar elementos verticalmente
- **ListView**: Para listas de produtos
- **TextField**: Para entrada de texto em login/cadastro
- **Drawer**: Menu lateral de navegação
- **BottomNavigationBar**: Navegação por abas
- **Icon**: Exibição de ícones
- **ScaleTransition & FadeTransition**: Animações na Splash Screen
- **AppBar**: Barra superior de navegação
- **Scaffold**: Estrutura básica das telas

## 🎨 Design e Estilo

- **Cores principais**: Purple (#5D3F8B) e Orange (#FF9500)
- **Fonte padrão**: Sistema padrão do Flutter
- **Tema**: Material Design 3
- **Padronização**: Consistência visual em todas as telas

## 💾 Gerenciamento de Estado

- **setState**: Utilizado para gerenciar estado local de favoritos
- **Lógica local**: Sem persistência em banco de dados (conforme requisitos)
- **Atualização automática**: Favoritos sincronizam entre telas

## 🔐 Validações Implementadas

### Login
- E-mail não vazio
- Senha não vazia
- Validação básica de formato de e-mail

### Cadastro
- Todos os campos obrigatórios
- Validação de senhas iguais
- Validação de comprimento mínimo de senha
- Feedback visual de erros e sucesso

## ⚠️ Limitações e Observações

1. **Dados simulados**: Todos os produtos e usuários são armazenados em memória
2. **Sem persistência**: Os dados são perdidos ao fechar o aplicativo
3. **Sem autenticação real**: O login é apenas validação de formulário
4. **Sem API real**: Os produtos são mockados localmente
5. **Sem carrinho de compras**: O botão "Adicionar ao Carrinho" apenas exibe um SnackBar

## 🌟 Funcionalidades Extras (Bônus)

- ✅ **Splash Screen com Animação**: Implementada com animações de scale e fade
- Pontuação extra: +1.0

## 📝 Critérios de Avaliação Atendidos

| Critério | Status | Pontos |
|----------|--------|--------|
| Telas de Login e Cadastro com validações | ✅ | 1.0 |
| Navegação funcional entre todas as telas | ✅ | 1.0 |
| Tela de Produtos com favoritos funcionais | ✅ | 2.0 |
| Tela "Meus Produtos" exibindo corretamente os favoritos | ✅ | 2.0 |
| Uso adequado de ListView, Row, Column, Container | ✅ | 1.0 |
| Organização modular e boas práticas de código | ✅ | 2.0 |
| Design, criatividade e padronização visual | ✅ | 1.0 |
| **Splash Screen com animação (Bônus)** | ✅ | +1.0 |
| **TOTAL** | ✅ | **11.0** |

## 🔗 Repositório Git

O projeto está disponível em um repositório Git com:
- ✅ Todos os arquivos necessários
- ✅ Histórico de commits
- ✅ README.md detalhado
- ✅ Estrutura organizada e modular

```bash
# Para ver o histórico de commits
git log --oneline

# Para clonar o repositório
git clone <url_do_repositorio>
```

## 👨‍💻 Desenvolvedor

**Murilo da Silva**
- Aluno de Desenvolvimento Mobile
- SENAI

---

**Versão**: 1.0.0  
**Data de Conclusão**: 19 de Novembro de 2025  
**Platform**: Flutter 3.9.2+  
**Dart**: 3.9.2+
