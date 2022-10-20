<!-- # local_access

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# Receitas: Acesso em bloco

Nesta receita, vamos dar uma olhada em como usar **BlocProvider** para tornar um bloco acessível em toda a árvore de widgets. Vamos explorar três cenários: Acesso Local, Acesso à Rota e Acesso Global.

## Acesso local

Neste exemplo, vamos usar **BlocProvider** para disponibilizar um bloco para uma subárvore local. Nesse contexto, local significa dentro de um contexto em que não há rotas sendo empurradas/populadas.

> ## Bloc

Por uma questão de simplicidade, vamos usar um **Counter** como nosso aplicativo de exemplo.

Nosso **CounterBloc** implementação ficará assim:

```dart
abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}
```
[counter_bloc.dart](lib/counter_bloc.dart).

> ## IU

Teremos 3 partes em nossa interface do usuário:

- App: o widget do aplicativo raiz.
- CounterPage: o widget de container que irá gerenciar o **CounterBloc** e expõe **FloatingActionButtons** para **Increment** e **Decrement** o contador.
- CounterText: um widget de texto que é responsável por exibir o **count**.

### :pushpin: Aplicativo

Nosso **App** widget é um **StatelessWidget** que usa um **MaterialApp** e define nosso **CounterPage** como o widget inicial. o **App** widget é responsável por criar e fechar o **CounterBloc** bem como disponibilizá-lo ao **CounterPage** usando um **BlocProvider**.

> Nota: Quando envolvemos um widget com **BlocProvider**, podemos fornecer um bloco para todos os widgets dessa subárvore. Neste caso, podemos acessar o **CounterBloc** de dentro do **CounterPage** widget e quaisquer filhos do CounterPagewidget usando **BlocProvider.of<CounterBloc>(context);**.

[main.dart](lib/main.dart).

### :pushpin: CounterPage

o **CounterPage** widget é um **StatelessWidget** que acessa o **CounterBloc** através do **BuildContext**.

[counter_page.dart](lib/counter_page.dart).

### :pushpin: CounterText

Nosso **CounterText** widget está usando um **BlocBuilder** reconstruir-se sempre que o **CounterBloc** mudanças de estado. Nós usamos **BlocProvider.of<CounterBloc>(context);** para acessar os dados fornecidos **CounterBloc** e devolver um **Text** widget com a contagem atual.

[counter_text.dart](lib/counter_text.dart).

Isso encerra a parte de acesso ao bloco local desta receita e o código-fonte completo pode ser encontrado [aqui](https://gist.github.com/felangel/20b03abfef694c00038a4ffbcc788c35).

Em seguida, veremos como fornecer um bloco em várias páginas/rotas.

Dependência:
    flutter_bloc: ^8.1.1
