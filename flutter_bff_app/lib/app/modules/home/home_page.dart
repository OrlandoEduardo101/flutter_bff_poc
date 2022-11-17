import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  final HomeStore store;
  const HomePage({Key? key, this.title = "Home", required this.store}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get store => widget.store;
  @override
  void initState() {
    super.initState();
    store.fetchItens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScopedBuilder<HomeStore, Exception, List<DsModel>>(
        store: store,
        onState: (_, state) {
          return Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.length,
              separatorBuilder: (context, index) => const SizedBox(width: 50,),
              itemBuilder: (context, index) {
                final item = state[index];
                return ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed('/blankPage', arguments: item);
                  },
                  child: Text('Item $index ${item.title}'),
                );
              },
            ),
          );
        },
        onLoading: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onError: (context, error) => const Center(
          child: Text(
            'error',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
