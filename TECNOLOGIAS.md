# 🔧 Documentação Técnica - Flutter Store

## 📋 Índice
1. [Stack Tecnológico](#stack-tecnológico)
2. [Arquitetura](#arquitetura)
3. [Estrutura de Código](#estrutura-de-código)
4. [Padrões Utilizados](#padrões-utilizados)
5. [Componentes Principais](#componentes-principais)
6. [Fluxo de Dados](#fluxo-de-dados)

---

## 🏗️ Stack Tecnológico

```
┌─────────────────────────────────────────────┐
│         Aplicação (main.dart)               │
└─────────────────────────────────────────────┘
                       │
        ┌──────────────┼──────────────┐
        │              │              │
    ┌───▼───┐      ┌───▼───┐     ┌───▼───┐
    │Screens│      │Models │     │Widgets│
    └───────┘      └───────┘     └───────┘
        │              │              │
        └──────────────┼──────────────┘
                       │
        ┌──────────────┼──────────────┐
        │              │              │
    ┌───▼─────┐  ┌────▼─────┐  ┌───▼────────┐
    │ Flutter │  │   Dart   │  │  Material  │
    │ Framework│  │ Language │  │  Design 3  │
    └──────────┘  └──────────┘  └────────────┘
```

---

## 🎯 Arquitetura

### Padrão MVC Simplificado

```
Models (lib/models/)
├── Product.dart
│   ├── id: int
│   ├── name: String
│   ├── description: String
│   ├── price: double
│   ├── imageUrl: String
│   └── category: String
│
└── User.dart
    ├── name: String
    ├── email: String
    └── password: String

Views/Screens (lib/screens/)
├── splash_screen.dart
├── login_screen.dart
├── signup_screen.dart
├── home_screen.dart
├── products_screen.dart
├── product_detail_screen.dart
├── favorites_screen.dart
└── about_screen.dart

Controllers (em cada screen)
└── setState() para gerenciamento de estado
```

### Fluxo de Camadas

```
┌─────────────────────────┐
│    Presentation Layer   │
│  (Screens/Widgets)      │
└────────────┬────────────┘
             │
             │ setState()
             │
┌────────────▼────────────┐
│   Business Logic Layer  │
│  (Validations, Logic)   │
└────────────┬────────────┘
             │
             │
┌────────────▼────────────┐
│      Data Layer         │
│  (Models, Local Data)   │
└─────────────────────────┘
```

---

## 📂 Estrutura de Código

### 1. Models (lib/models/)

#### Product.dart
```dart
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}
```

#### User.dart
```dart
class User {
  final String name;
  final String email;
  final String password;

  User({
    required this.name,
    required this.email,
    required this.password,
  });
}
```

### 2. Screens (lib/screens/)

#### Padrão de Screen StatefulWidget
```dart
class ScreenNameScreen extends StatefulWidget {
  const ScreenNameScreen({super.key});

  @override
  State<ScreenNameScreen> createState() => _ScreenNameScreenState();
}

class _ScreenNameScreenState extends State<ScreenNameScreen> {
  // Estado local
  String? _errorMessage;
  
  // Métodos
  void _validateInput() {
    setState(() {
      // Atualizar estado
    });
  }
  
  // Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(),
    );
  }
}
```

---

## 🎨 Padrões Utilizados

### 1. setState Pattern
```dart
// Para atualizar estado local
setState(() {
  _favorites.add(productId);
  // Rebuilda o widget
});
```

### 2. Navigation Pattern
```dart
// Push nova tela
Navigator.of(context).push(
  MaterialPageRoute(builder: (_) => NewScreen()),
);

// Pop tela atual
Navigator.of(context).pop();

// Replace (sem volta)
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (_) => LoginScreen()),
  (route) => false,
);
```

### 3. Validação Pattern
```dart
void _validate() {
  if (field.isEmpty) {
    setState(() => _error = "Campo obrigatório");
    return;
  }
  
  if (!isValid(field)) {
    setState(() => _error = "Formato inválido");
    return;
  }
  
  // Sucesso - prosseguir
}
```

### 4. Animação Pattern
```dart
late AnimationController _controller;
late Animation<double> _animation;

@override
void initState() {
  _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  );
  
  _animation = Tween(begin: 0.0, end: 1.0)
    .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  
  _controller.forward();
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

---

## 🧩 Componentes Principais

### 1. SplashScreen
```
├── AnimationController
│   ├── ScaleTransition (0.5 → 1.0)
│   └── FadeTransition (0.0 → 1.0)
├── CircularProgressIndicator
└── Future.delayed → Navigator
```

**Duração**: 3 segundos
**Curva**: Curves.elasticOut

### 2. LoginScreen
```
├── Gradient Background
├── AppBar (Drawer)
├── Form
│   ├── TextField (Email)
│   ├── TextField (Password)
│   ├── ErrorMessage (condicional)
│   └── ElevatedButton (Entrar)
└── Link → SignUpScreen
```

**Validações**:
- E-mail não vazio
- Senha não vazia
- E-mail com @

### 3. HomeScreen
```
├── PopScope (canPop: false)
├── AppBar (title: "Flutter Store")
├── Drawer
│   ├── DrawerHeader
│   └── ListTile[] (menu items)
├── BottomNavigationBar
│   └── 4 abas
└── Body
    └── Pages[] (dinâmico)
```

**Páginas**:
1. Home (categorias + destaques)
2. Produtos (lista)
3. Favoritos
4. Sobre

### 4. ProductsScreen
```
├── ListView.builder
│   └── ProductCard
│       ├── Container (imagem)
│       ├── Column (info)
│       │   ├── Text (nome)
│       │   ├── Text (categoria)
│       │   └── Text (preço)
│       └── IconButton (favoritar)
└── GestureDetector → Detalhes
```

**Props**:
- `favorites`: List<int>
- `onFavoriteToggle`: Function(int)

### 5. FavoritesScreen
```
├── Conditional
│   ├── Vazio
│   │   └── EmptyState
│   └── Itens
│       └── ListView (como Products)
└── Auto-update
    └── setState() em Home
```

---

## 🔄 Fluxo de Dados

### Login Flow
```
┌─────────────────┐
│  LoginScreen    │
└────────┬────────┘
         │ email, password
         │
    ┌────▼────┐
    │Validate │─→ Erro? → setState() → exibir
    └────┬────┘
         │
    ┌────▼─────────────┐
    │ Navigator.push   │ → HomeScreen
    └──────────────────┘
```

### Favoritos Flow
```
┌────────────────┐
│ ProductsScreen │
└────────┬───────┘
         │ clique em ♥
         │
    ┌────▼──────────────────┐
    │ onFavoriteToggle(id)  │
    └────┬──────────────────┘
         │
    ┌────▼──────────────┐
    │ setState()        │ ← Atualiza Home._favorites
    │ toggle favorito   │
    └────┬──────────────┘
         │
    ┌────▼──────────────┐
    │ FavoritesScreen   │
    │ filtra by id      │
    └──────────────────┘
```

### Navegação Flow
```
SplashScreen (3s)
         │
         ▼
    LoginScreen
         │
    ┌────┴──────────────┐
    │                   │
    ▼                   ▼
HomeScreen      SignUpScreen
    │               │
    ├─ Products     │
    ├─ Favorites    └────→ LoginScreen
    ├─ About
    └─ Logout → LoginScreen
```

---

## 💾 Gerenciamento de Estado

### Local State (setState)
```dart
// Em cada screen
List<int> _favorites = [];

void _toggleFavorite(int id) {
  setState(() {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
  });
}
```

### Compartilhado (HomeScreen)
```dart
// HomeScreen gerencia favoritos
List<int> _favorites = [];

// Passa para ProductsScreen
ProductsScreen(
  favorites: _favorites,
  onFavoriteToggle: (id) {
    setState(() {
      // toggle
    });
  },
)

// Passa para FavoritesScreen
FavoritesScreen(favoriteIds: _favorites)
```

---

## 🎨 Design System

### Cores
```dart
// Primary
Colors.deepPurple       // #5D3F8B
Colors.deepPurple.shade700
Colors.deepPurple.shade500
Colors.deepPurple.shade100

// Accent
Colors.orange          // #FF9500

// Semantic
Colors.red             // Favorito
Colors.grey            // Desabilitado
Colors.white           // Background
```

### Tipografia
```dart
// Padrão do Material Design 3
TextStyle fontSize: 24, fontWeight: FontWeight.bold
TextStyle fontSize: 18, fontWeight: FontWeight.bold
TextStyle fontSize: 16, fontWeight: FontWeight.bold
TextStyle fontSize: 14, color: Colors.grey
TextStyle fontSize: 12, color: Colors.grey
```

### Spacing
```dart
SizedBox height: 20    // Grande
SizedBox height: 15    // Médio
SizedBox height: 10    // Pequeno
SizedBox height: 5     // Mínimo
```

---

## 🔐 Segurança

### Validação de Input
```dart
// Email
bool isValidEmail(String email) {
  return email.contains('@');
}

// Senha
bool isValidPassword(String password) {
  return password.length >= 6;
}

// Campos vazios
bool isNotEmpty(String value) {
  return value.trim().isNotEmpty;
}
```

### Prevenção de Crashes
```dart
// Verificar mounted antes de setState
if (mounted) {
  setState(() {});
}

// Try-catch em async
try {
  await Future.delayed(...);
} catch (e) {
  print('Error: $e');
}
```

---

## 📊 Performance

### Otimizações
```dart
// 1. Usar const quando possível
const Text("Hello")

// 2. ListView.builder (não ListView)
ListView.builder(itemCount: products.length)

// 3. Evitar rebuild
final List<int> _favorites = []; // final

// 4. Lazy loading
itemExtent: 120,  // Melhora performance

// 5. Ícones otimizados
--tree-shake-icons (flutter build)
```

### Métricas
- **Build Web Release**: ~35 segundos
- **Ícones Otimizados**: 99.4% redução
- **FPS Animações**: 60 FPS constant

---

## 🧪 Testes Sugeridos

### Unit Tests
```dart
test('Product model creation', () {
  final product = Product(
    id: 1,
    name: 'Test',
    price: 10.0,
    // ...
  );
  expect(product.name, 'Test');
});

test('Email validation', () {
  expect(isValidEmail('test@email.com'), true);
  expect(isValidEmail('invalidemail'), false);
});
```

### Widget Tests
```dart
testWidgets('Login button works', (WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();
  
  expect(find.byType(HomeScreen), findsOneWidget);
});
```

---

## 📚 Referências e Recursos

### Documentação
- [Flutter Docs](https://flutter.dev/docs)
- [Dart Language](https://dart.dev)
- [Material Design 3](https://material.io)

### Widgets Usados
- [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
- [Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
- [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- [AnimationController](https://api.flutter.dev/flutter/animation/AnimationController-class.html)

---

**Versão**: 1.0.0  
**Data**: 19 de Novembro de 2025  
**Desenvolvedor**: Murilo da Silva
