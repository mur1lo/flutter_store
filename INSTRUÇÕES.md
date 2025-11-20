# 🚀 Flutter Store - Guia Completo de Uso

## 📋 Índice
1. [Requisitos](#requisitos)
2. [Instalação](#instalação)
3. [Como Executar](#como-executar)
4. [Fluxo do Aplicativo](#fluxo-do-aplicativo)
5. [Funcionalidades Detalhadas](#funcionalidades-detalhadas)
6. [Estrutura de Pastas](#estrutura-de-pastas)
7. [Tecnologias Utilizadas](#tecnologias-utilizadas)

---

## 📱 Requisitos

### Sistema Operacional
- **macOS**: Macs com Apple Silicon ou Intel
- **Linux**: Ubuntu 18.04 ou superior
- **Windows**: Windows 10 ou superior

### Software
- **Flutter SDK**: 3.9.2 ou superior
- **Dart SDK**: 3.9.2 ou superior (incluído no Flutter)
- **Git**: Qualquer versão recente
- **IDE**: VS Code, Android Studio ou IntelliJ

### Dispositivo
- **Emulador Android**: Android Studio ou Genymotion
- **Simulador iOS**: Xcode (macOS apenas)
- **Dispositivo Físico**: Android 5.0+ ou iOS 11.0+

---

## 📦 Instalação

### 1. Verificar se Flutter está instalado
```bash
flutter --version
dart --version
```

Se não tiver instalado, visite: https://flutter.dev/docs/get-started/install

### 2. Clonar o Repositório
```bash
# Via HTTPS
git clone https://github.com/seu-usuario/flutter_store.git

# Via SSH
git clone git@github.com:seu-usuario/flutter_store.git

# Entrar na pasta
cd flutter_store
```

### 3. Instalar Dependências
```bash
flutter pub get
```

### 4. Verificar Setup
```bash
flutter doctor
```

Certifique-se de que nenhuma ferramenta crítica está faltando.

---

## 🏃 Como Executar

### Executar no Simulador iOS (macOS)
```bash
# Abrir simulador
open -a Simulator

# Executar app
flutter run
```

### Executar no Emulador Android
```bash
# Abrir emulador (assumindo Android Studio instalado)
flutter emulators --launch Pixel_4_API_30

# Executar app
flutter run
```

### Executar em Dispositivo Físico
```bash
# 1. Conectar dispositivo via USB
# 2. Ativar "USB Debugging" (Android) ou "Developer Mode" (iOS)
# 3. Executar:
flutter run
```

### Executar em Web
```bash
flutter run -d chrome
# ou
flutter run -d edge
```

### Executar em Windows
```bash
flutter run -d windows
```

### Modo Debug vs Release
```bash
# Debug (com prints e debugging)
flutter run

# Release (otimizado)
flutter run --release

# Profiling
flutter run --profile
```

---

## 🎯 Fluxo do Aplicativo

```
┌─────────────────────┐
│   Splash Screen     │ ← Animação por 3 segundos
│   (Bônus - 1 ponto) │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────────────────────────────┐
│           Tela de Login                     │
│  - Validação de E-mail                      │
│  - Validação de Senha                       │
│  - Link para Criar Conta                    │
└──────────┬──────────────────────────────────┘
           │
        ┌──┴──┬────────────────────┐
        │     │                    │
    Entrar    └→ Criar Conta       │
        │        (Cadastro)        │
        │        (Voltar)          │
        │                          │
        └──────────┬───────────────┘
                   │
                   ▼
        ┌──────────────────────┐
        │   Tela Home          │
        │ (Bem-vindo)          │
        │ Drawer + Bottom Nav  │
        └──────────┬───────────┘
                   │
        ┌──────────┼────────────────┬──────────────┐
        │          │                │              │
        ▼          ▼                ▼              ▼
    Produtos   Meus Produtos    Sobre          Sair
    (Lista)    (Favoritos)    (Info)         (Login)
       │            │                         
       │            │   
       ▼            ▼   
    Detalhes   Detalhes
    (Info)     (Info)
```

---

## 🔍 Funcionalidades Detalhadas

### 1️⃣ Splash Screen (3 segundos)
- **Animação**: Scale + Fade
- **Ícone**: Shopping Bag
- **Carregamento**: Circular Progress Indicator
- **Transição**: Automática para Login

**Testes**:
```
✓ Exibe logo com animação
✓ Progress indicator funciona
✓ Transição para login após 3s
```

### 2️⃣ Tela de Login
**Campos**:
- E-mail
- Senha
- Botão "Entrar"
- Link "Criar Conta"

**Validações**:
```javascript
if (email.isEmpty) {
  Mostrar: "Por favor, preencha todos os campos!"
}
if (!email.contains('@')) {
  Mostrar: "E-mail inválido!"
}
if (password.isEmpty) {
  Mostrar: "Por favor, preencha todos os campos!"
}
```

**Testes**:
```
✓ Botão desabilitado com campos vazios
✓ Valida formato de e-mail
✓ Redireciona para Home com dados corretos
✓ Exibe mensagens de erro
```

### 3️⃣ Tela de Cadastro
**Campos**:
- Nome Completo
- E-mail
- Senha
- Confirmar Senha
- Botão "Criar Conta"
- Link "Voltar ao Login"

**Validações**:
```javascript
if (password.length < 6) {
  Mostrar: "A senha deve ter no mínimo 6 caracteres!"
}
if (password !== confirmPassword) {
  Mostrar: "As senhas não conferem!"
}
if (allFieldsEmpty) {
  Mostrar: "Por favor, preencha todos os campos!"
}
```

**Testes**:
```
✓ Valida todos os campos
✓ Mostra sucesso com mensagem
✓ Redireciona para login após 2s
✓ Permite voltar sem salvar dados
```

### 4️⃣ Tela Home
**Componentes**:
- Header com gradient
- Categorias (Card com Ícones)
- Seção de Destaques
- Bottom Navigation (4 abas)
- Drawer (Menu lateral)

**Menu (Drawer)**:
```
👤 Avatar + Nome do usuário
├─ 🏠 Início
├─ 📦 Produtos
├─ ❤️ Meus Produtos
├─ 📄 Sobre
└─ 🚪 Sair
```

**Bottom Navigation**:
```
🏠 Início | 📦 Produtos | ❤️ Favoritos | 📄 Sobre
```

**Testes**:
```
✓ Drawer abre e fecha
✓ Bottom nav troca de página
✓ Todas as 4 páginas funcionam
✓ Sair redireciona para Login
✓ Categorias exibem corretamente
```

### 5️⃣ Tela de Produtos
**Conteúdo**:
- 8 produtos simulados
- Lista vertical (ListView)
- Cada item com:
  - Imagem (placeholder)
  - Nome
  - Categoria
  - Preço
  - Ícone de favoritar

**Produtos**:
```
1. Smartphone X - R$ 2.499,99
2. Fone de Ouvido Pro - R$ 899,99
3. Camiseta Premium - R$ 79,99
4. Calça Jeans Clássica - R$ 129,99
5. Flutter para Iniciantes - R$ 89,90
6. Dart Avançado - R$ 99,90
7. Luminária LED - R$ 159,99
8. Almofada Confortável - R$ 49,99
```

**Interações**:
- Clique no produto → Tela de Detalhes
- Clique no ♥ → Favorita/Desfavorita
- Ícone muda de cor (grey → red)

**Testes**:
```
✓ Lista exibe 8 produtos
✓ Clique navega para detalhes
✓ Favoritar funciona
✓ Ícone muda de cor ao favoritar
✓ Atualiza em tempo real
```

### 6️⃣ Tela de Detalhes
**Exibe**:
- Grande imagem (placeholder)
- Nome e categoria
- Preço em destaque (orange)
- Descrição completa
- Botão "Adicionar ao Carrinho"
- Botão "Voltar"
- Ícone favoritar/desfavoritar

**Funcionamento**:
```dart
onTap (Adicionar ao Carrinho) {
  Exibir SnackBar: "Produto adicionado ao carrinho!"
  Fechar após 2s
}

onTap (Voltar) {
  Pop stack (volta para produtos)
}

onTap (❤️) {
  Toggle favorito
  Ícone muda cor
  Atualiza favoritos no Home
}
```

**Testes**:
```
✓ Exibe todas as informações
✓ Botão "Adicionar" mostra SnackBar
✓ Favoritar funciona
✓ Voltar retorna à lista
✓ Preço formatado corretamente
```

### 7️⃣ Tela de Favoritos
**Funcionalidade**:
- Lista apenas produtos favoritados
- Vazia se nenhum favoritado
- Mensagem amigável quando vazia
- Navegação para detalhes funciona

**Estado Vazio**:
```
❤️ (Ícone grande)
"Nenhum produto favorito"
"Adicione produtos aos favoritos para vê-los aqui"
```

**Teste de Fluxo**:
```
1. Ir para Produtos
2. Clicar em ♥ de 3 produtos
3. Voltar para Favoritos
4. Verificar que 3 aparecem
5. Ir para um produto e desfavoritar
6. Voltar para Favoritos
7. Verificar que agora são 2
```

### 8️⃣ Tela Sobre
**Conteúdo**:
- Logo e versão
- Descrição da aplicação
- Funcionalidades listadas
- Tecnologias utilizadas
- Informações do desenvolvedor
- Dados de contato
- Cards com ícones

**Informações Exibidas**:
```
📱 Flutter Store v1.0.0

Sobre:
"A Flutter Store é uma aplicação de e-commerce..."

Funcionalidades:
  ✓ Login e Cadastro
  ✓ Catálogo de Produtos
  ✓ Sistema de Favoritos
  ✓ Navegação Fluida
  ✓ Design Moderno

Tecnologias:
  - Flutter
  - Dart
  - Material Design

Desenvolvedor:
  👤 Murilo da Silva
  Desenvolvedor Flutter

Contato:
  📧 contato@flutterstore.com
  📱 +55 (11) 9999-9999
```

**Testes**:
```
✓ Exibe todas as informações
✓ Layout responsivo
✓ Ícones exibem corretamente
✓ Scroll funciona em telas pequenas
```

---

## 📁 Estrutura de Pastas

```
flutter_store/
│
├── lib/
│   ├── main.dart                    # Ponto de entrada
│   │
│   ├── models/
│   │   ├── product.dart            # Classe Product
│   │   └── user.dart               # Classe User
│   │
│   └── screens/
│       ├── splash_screen.dart       # Splash com animação
│       ├── login_screen.dart        # Tela de login
│       ├── signup_screen.dart       # Tela de cadastro
│       ├── home_screen.dart         # Tela inicial
│       ├── products_screen.dart     # Lista de produtos
│       ├── product_detail_screen.dart # Detalhes
│       ├── favorites_screen.dart    # Favoritos
│       └── about_screen.dart        # Sobre
│
├── android/                         # Código Android
├── ios/                            # Código iOS
├── web/                            # Código Web
├── linux/                          # Código Linux
├── macos/                          # Código macOS
├── windows/                        # Código Windows
│
├── test/                           # Testes
├── build/                          # Build output
│
├── pubspec.yaml                    # Dependências
├── pubspec.lock                    # Lock file
├── analysis_options.yaml           # Linter rules
│
├── README_FLUTTER_STORE.md         # README principal
├── INSTRUÇÕES.md                   # Este arquivo
│
└── .git/                           # Repositório Git
```

---

## 🛠️ Tecnologias Utilizadas

### Framework & Linguagem
| Tecnologia | Versão | Descrição |
|-----------|--------|-----------|
| **Flutter** | 3.9.2+ | Framework mobile |
| **Dart** | 3.9.2+ | Linguagem de programação |
| **Material Design** | 3 | Design system |

### Widgets Principais
```dart
// Layout
Container, Row, Column, ListView, Scaffold

// Input
TextField, Form, TextFormField

// Navigation
Navigator, Drawer, BottomNavigationBar

// Display
Card, Icon, Text, AppBar

// Animação
AnimationController, ScaleTransition, FadeTransition

// Feedback
SnackBar, Dialog, AlertDialog
```

### Padrões de Código
- **MVC Simplificado**: Models, Views (Screens), Controllers (Logic)
- **setState**: Gerenciamento de estado local
- **Hot Reload**: Desenvolvimento rápido
- **Material Design**: UI/UX consistente

---

## 🐛 Troubleshooting

### Problema: "flutter command not found"
```bash
# Adicionar ao PATH
export PATH="$PATH:/Users/seu-usuario/flutter/bin"
```

### Problema: "Doctor says issues"
```bash
flutter doctor -v

# Aceitar licenses
flutter doctor --android-licenses
```

### Problema: Build falha
```bash
# Limpar cache
flutter clean
flutter pub get
flutter run
```

### Problema: Simulador não abre
```bash
# Listar emuladores
flutter emulators

# Executar específico
flutter emulators --launch <nome>
```

### Problema: Erros de Lint
```bash
# Verificar erros
flutter analyze

# Corrigir automaticamente
dart fix --apply
```

---

## 📊 Performance

### Otimizações Implementadas
- ✓ `const` widgets onde possível
- ✓ Lazy loading em ListView
- ✓ Evitar rebuilds desnecessários
- ✓ Ícones otimizados (tree-shaking)

### Métricas
- **Build**: ~35 segundos (release)
- **Tamanho web**: Otimizado (9.5 KB ícones)
- **Performance**: 60 FPS animações

---

## 🎓 Aprendizados Principais

1. **Navegação**: Navigator, routes, named routes
2. **Estado**: setState, lifecycle dos widgets
3. **Validação**: Inputs e formulários
4. **Animação**: Controllers, Transitions
5. **Organização**: Separação de telas/modelos
6. **Git**: Versionamento e commits

---

## 📞 Suporte

Para dúvidas sobre:
- **Flutter**: https://flutter.dev/docs
- **Dart**: https://dart.dev/guides
- **Material Design**: https://material.io

---

## ✅ Checklist Final

Antes de entregar:

- [ ] Todos os arquivos estão no repositório
- [ ] `flutter analyze` sem erros
- [ ] `flutter build web --release` compilou
- [ ] Todas as 7 telas funcionam
- [ ] Favoritos sincronizam corretamente
- [ ] Validações funcionam
- [ ] Navegação funciona (drawer + bottom nav)
- [ ] Animação de splash funciona
- [ ] README.md está completo
- [ ] Git tem commits com histórico

---

**Desenvolvido com ❤️ usando Flutter**

Data: 19 de Novembro de 2025
