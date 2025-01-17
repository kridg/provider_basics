import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/counter_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(builder: (context, value, child)=>Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You pressed the button this many times',),
            Text(
              value.count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //get access to model class
          final counter = context.read<CounterModel>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),),
    ),
    );
  }
}
