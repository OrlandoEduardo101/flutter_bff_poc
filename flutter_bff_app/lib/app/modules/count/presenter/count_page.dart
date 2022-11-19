import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'count_store.dart';

class CountPage extends StatefulWidget {
  final String title;
  final CountStore store;
  const CountPage({Key? key, this.title = 'CountPage', required this.store}) : super(key: key);
  @override
  CountPageState createState() => CountPageState();
}

class CountPageState extends State<CountPage> {
  CountStore get store => widget.store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ScopedBuilder<CountStore, Exception, int>.transition(
            store: store,
            onLoading: (context) => const Center(child: CircularProgressIndicator.adaptive(),),
            onState: (context, state) => Center(child: Text('$state'),),
          ),
        ],
      ),
      floatingActionButton: Row(children: [
        FloatingActionButton(onPressed: store.decrementCount, child: const Icon(Icons.remove)),
        FloatingActionButton(onPressed: store.incrementCount, child: const Icon(Icons.add)),
      ],),
    );
  }
}
