<!-- # navigation_2dot0

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# Navegação 2.0

Neste exemplo, veremos como usar a API de páginas do Navigator 2.0 para lidar com roteamento em resposta a mudanças de estado em um bloco.

Observação: vamos usar [package:flow_builder](https://pub.dev/packages/flow_builder) para simplificar o trabalho com a API do Navigator 2.0.

> ## Bloc

Para mostrar as vantagens do Navigator, vamos construir um exemplo um pouco mais complexo. Vamos construir **BookBloc** que vai levar **BookEvents** e convertê-los em **BookStates**.

### :pushpin: BookEvent

**BookEvent** responderá a dois eventos: selecionar um livro e desmarcar um livro.

BookState

**BookState** conterá a lista de livros e um livro opcional selecionado se o usuário tocar em um livro.

Bloco de Livros

**BookBloc** vai lidar com a resposta a cada **BookEvent** e emitirá as devidas **BookState** em resposta:

Camada de IU

Agora vamos conectar o bloco à nossa interface do usuário usando **FlowBuilder**!

A fonte completa desta receita pode ser encontrada [aqui](https://gist.github.com/felangel/bd3cf504a10c0763a32f7a94e2649369).

Dependência:
    flutter_bloc: ^8.1.1
    flow_builder: ^0.0.9
    equatable: ^2.0.5
