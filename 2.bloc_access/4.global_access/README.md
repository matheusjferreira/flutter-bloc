<!-- # global_access

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# Acesso Global

Neste último exemplo, vamos demonstrar como tornar uma instância de bloco disponível para toda a árvore de widgets. Isso é útil para casos específicos como um **AuthenticationBloc** ou **ThemeBloc** porque esse estado se aplica a todas as partes do aplicativo. 

> ## Bloc

Como de costume, vamos usar o **CounterBloc** como nosso exemplo de simplicidade.

[counter_bloc.dart](lib/counter_bloc.dart).

> ## IU

Vamos seguir a mesma estrutura de aplicação do exemplo "Acesso Local". Como resultado, teremos três partes em nossa interface do usuário:

- App: o widget do aplicativo raiz que gerencia a instância global do nosso **CounterBloc**.
- CounterPage: o widget de contêiner que expõe **FloatingActionButtons** para **Increment** e **Decrement** o contador.
- CounterText: um widget de texto que é responsável por exibir o **count**. 

> ### :pushpin: Aplicativo

Assim como no exemplo de acesso local acima, o **App** gerencia a criação, fechamento e fornecimento de **CounterBloc** para a subárvore usando **BlocProvider**. A principal diferença é neste caso, **MaterialApp** é filho de **BlocProvider**.

Envolvendo todo o **MaterialApp** em um **BlocProvider** é a chave para tornar a nossa **CounterBloc** instância globalmente acessível. Agora podemos acessar nosso **CounterBloc** de qualquer lugar em nosso aplicativo onde temos um **BuildContext** usando **BlocProvider.of<CounterBloc>(context);**.

> Observação: essa abordagem ainda funciona se você estiver usando um **CupertinoApp** ou **WidgetsApp**.

[main.dart](lib/main.dart).

> ### :pushpin: CounterPage

Nosso **CounterPage** é um **StatelessWidget** porque não precisa gerenciar nenhum estado próprio. Assim como mencionamos acima, ele usa **BlocProvider.of<CounterBloc>(context);** para acessar a instância global do **CounterBloc**.

[counter_page.dart](lib/counter_page.dart).

> ### :pushpin: Contratexto

Nada de novo aqui; a **CounterText** widget é o mesmo que no primeiro exemplo. É apenas um **StatelessWidget** que usa um **BlocBuilder** para renderizar novamente quando o **CounterBloc** muda de estado e acessa o mundo **CounterBloc** instância usando **BlocProvider.of<CounterBloc>(context);**.

[counter_text.dart](lib/counter_text.dart).

Isso é tudo o que há para isso! A fonte completa pode ser encontrada [aqui](https://gist.github.com/felangel/be891e73a7c91cdec9e7d5f035a61d5d).

Dependência:
    flutter_bloc: ^8.1.1
