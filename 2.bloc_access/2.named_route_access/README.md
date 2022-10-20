<!-- # named_route_access

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# Acesso à rota nomeada

Neste exemplo, vamos usar **BlocProvider** para acessar um bloco em várias rotas nomeadas. Quando uma nova rota nomeada é enviada, ela terá um **BuildContext** (assim como antes) que não tem mais referência aos blocos fornecidos anteriormente. Neste caso, vamos gerenciar os blocos que queremos escopo no widget pai e fornecê-los seletivamente para as rotas que devem ter acesso.

> ## Bloc

Novamente, vamos usar o **CounterBloc** pela simplicidade.

[counter_bloc.dart](lib/counter_bloc.dart).

> ## IU

Novamente, teremos três partes na interface do usuário do nosso aplicativo:

- App: o widget do aplicativo raiz que gerencia o **CounterBloc** e o fornece para as rotas nomeadas apropriadas.
- HomePage: o widget de contêiner que acessa o **CounterBloc** e expõe **FloatingActionButtons** para **increment** e **decrement** o contador.
- CounterPage: um widget que é responsável por exibir o atual **count** como uma rota separada.

### :pushpin: Aplicativo

Nosso **App** widget é responsável por gerenciar a instância do **CounterBloc**, que forneceremos à raiz (**/**) e contador (**/counter**) rotas.

> :warning: É fundamental entender que, desde a **_AppState** está criando o **CounterBloc** instância, ele também deve fechá-lo no **dispose** sobrepor.

> :warning: Estamos usando **BlocProvider.value ao fornecer o **CounterBloc** instância para as rotas porque não queremos o **BlocProvider** para lidar com a eliminação do bloco (já que **_AppState** é responsável por isso).

[main.dart](lib/main.dart).

### :pushpin: HomePage

o **HomePage** é semelhante ao exemplo acima; no entanto, quando o usuário toca no **ElevatedButton**, enviamos uma nova rota nomeada para navegar até o **/counter** rota que definimos acima.

[home_page.dart](lib/home_page.dart).

### :pushpin: CounterPage 

**CounterPage** é super simples **StatelessWidget** que usa **BlocBuilder** para renderizar novamente **Text** widget com a contagem atual. Assim como antes, podemos usar **BlocProvider.of<CounterBloc>(context);** para acessar o **CounterBloc**.

[counter_page.dart](lib/counter_page.dart).

Isso é tudo que existe neste exemplo e a fonte completa pode ser encontrada [aqui](https://gist.github.com/felangel/8d143cf3b7da38d80de4bcc6f65e9831).

A seguir, veremos como criar um **Router** para gerenciar e definir o escopo de um bloco para apenas uma ou mais rotas geradas.

Dependência:
    flutter_bloc: ^8.1.1
