<!-- # anonymous_route_access

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# Acesso à rota anônima

Neste exemplo, vamos usar BlocProviderpara acessar um bloco através de rotas. Quando uma nova rota é empurrada, ela terá um BuildContextque não tem mais referência aos blocos fornecidos anteriormente. Como resultado, temos que envolver a nova rota em uma BlocProvider.

> ## Bloc

Novamente, vamos usar o **CounterBloc** pela simplicidade.

[counter_bloc.dart](lib/counter_bloc.dart).

> ## IU

Novamente, teremos três partes na interface do usuário do nosso aplicativo:

- App: o widget do aplicativo raiz.
- HomePage: o widget de container que irá gerenciar o CounterBloce expõe FloatingActionButtonspara Incremente Decremento contador.
- CounterPage: um widget que é responsável por exibir o atual countcomo uma rota separada.

### Aplicativo

Novamente, nosso **App** widget é o mesmo de antes.

[main.dart](lib/main.dart).

### HomePage

o **HomePage** é semelhante ao **CounterPage** no exemplo acima; no entanto, em vez de renderizar um **CounterText** widget, ele renderiza um **ElevatedButton** no centro que permite ao usuário navegar para uma nova tela que exibe a contagem atual.

Quando o usuário toca no **ElevatedButton**, nós empurramos um novo **MaterialPageRoute** e devolver o **CounterPage**. No entanto, estamos embrulhando o **CounterPage** em um **BlocProvider** para tornar a corrente **CounterBloc** instância disponível na próxima página.

> :warning: É fundamental que estejamos usando **BlocProvider's** value constructor neste caso porque estamos fornecendo uma instância existente de **CounterBloc**. O construtor de valor de **BlocProvider** deve ser usado apenas nos casos em que queremos fornecer um bloco existente para uma nova subárvore. Além disso, usar o construtor de valor não fechará o bloco automaticamente o que, neste caso, é o que queremos (já que ainda precisamos do **CounterBloc** para funcionar nos widgets ancestrais). Em vez disso, simplesmente passamos o valor existente **CounterBloc** para a nova página como um valor existente em oposição a um construtor. Isso garante que o único nível superior **BlocProvider** pega fechando o **CounterBloc** quando não for mais necessário.

[home_page.dart](lib/home_page.dart).

### CounterPage

**CounterPage** é super simples **StatelessWidget** que usa **BlocBuilder** para renderizar novamente **Text** widget com a contagem atual. Assim como antes, podemos usar **BlocProvider.of<CounterBloc>(context);** para acessar o **CounterBloc**.

[counter_page.dart](lib/counter_page.dart).

Isso é tudo que existe neste exemplo e a fonte completa pode ser encontrada [aqui](https://gist.github.com/felangel/92b256270c5567210285526a07b4cf21).

Em seguida, veremos como definir o escopo de um bloco para apenas uma ou mais rotas nomeadas.

Dependência:
    flutter_bloc: ^8.1.1
