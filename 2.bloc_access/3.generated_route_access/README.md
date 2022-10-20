<!-- # generated_route_access

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# Acesso de rota gerado

Neste exemplo, vamos criar um **Router** e use **BlocProvider** para acessar um bloco em várias rotas geradas. Vamos gerenciar os blocos que queremos abranger no **Router** e fornecê-los seletivamente para as rotas que deveriam ter acesso.

> ## Bloc

Novamente, vamos usar o **CounterBloc** pela simplicidade.

[counter_bloc.dart](lib/counter_bloc.dart).

> ## IU

Novamente, teremos três partes na interface do usuário do nosso aplicativo, mas também adicionaremos um **AppRouter**:

- App: o widget do aplicativo raiz que gerencia o **AppRouter**.
- AppRouter: classe que irá gerenciar e fornecer o **CounterBloc** para as rotas geradas apropriadas.
- HomePage: o widget de contêiner que acessa o **CounterBloc** e expõe **FloatingActionButtons** para **Increment** e **Decrement** o contador.
- CounterPage: um widget que é responsável por exibir o atual **count** como uma rota separada.

### :pushpin: Aplicativo

Nosso **App** widget é responsável por gerenciar a instância do **AppRouter** e usa o roteador **onGenerateRoute** para determinar a rota atual.

> :warning: Precisamos desfazer o **_router** quando o **App** widget é descartado para fechar todos os blocos no **AppRouter**.

[main.dart](lib/main.dart).

### :pushpin: Roteador de aplicativos

Nosso **AppRouter** é responsável por gerenciar a instância do **CounterBloc** e fornece **onGenerateRoute** que retorna a rota correta com base no fornecido **RouteSettings**.

> :warning: Desde o **AppRouter** cria o **CounterBloc** instância, deve também expor um **dispose** que **closes** a **CounterBloc** instância. **dispose** é chamado de **_AppState** widgets **dispose** sobrepor.

> :warning: Estamos usando **BlocProvider.value** ao fornecer o **CounterBloc** instância para as rotas porque não queremos o **BlocProvider** para lidar com a eliminação do bloco (já que **AppRouter** é responsável por isso).

[app_router.dart](lib/app_router.dart).

### :pushpin: Pagina inicial

o **HomePage** é idêntico ao exemplo acima. Quando o usuário toca no **ElevatedButton**, enviamos uma nova rota nomeada para navegar até o **/counter** rota que definimos acima.

[home_page.dart](lib/home_page.dart).

### :pushpin: CounterPage

**CounterPage** é super simples **StatelessWidget** que usa **BlocBuilder** para renderizar novamente **Text** widget com a contagem atual. Assim como antes, podemos usar **BlocProvider.of<CounterBloc>(context);** para acessar o **CounterBloc**.

[counter_page.dart](lib/counter_page.dart).

Isso é tudo que existe neste exemplo e a fonte completa pode ser encontrada [aqui](https://gist.github.com/felangel/354f9499dc4573699c62fc90c6bb314e).

Por último, veremos como tornar um bloco globalmente disponível para a árvore de widgets.

Dependência:
    flutter_bloc: ^8.1.1
