import 'package:counter_app/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: counterBloc,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
              backgroundColor: Colors.teal, 
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${BlocProvider.of<CounterBloc>(context).state.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text('${counterBloc.state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,)
                ],
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.add(DecrementEvent());
                    },
                    tooltip: 'Increment',
                    backgroundColor: Colors.red.shade100,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.add(IncrementEvent());
                    },
                    tooltip: 'Increment',
                    backgroundColor: Colors.teal.shade100,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ) // This trailing comma makes auto-formatting nicer for build methods.
            );
      },
    );
  }
}
