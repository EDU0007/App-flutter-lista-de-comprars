import 'package:app_flutter/modal.dart';
import 'package:app_flutter/models/item.dart';
import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  List<Item> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(color: Colors.deepPurple),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: Icon(
                        items[index].iSDone ? Icons.done_all : Icons.done)),
                backgroundColor: Colors.black26,
              ),
              title: Text(
                items[index].title,
                style: TextStyle(color: Colors.deepPurple),
              ),
              onTap: () {
                setState(() {
                  items[index].iSDone = !items[index].iSDone;
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem() async {
    final item = await showDialog<Item>(
        context: context,
        builder: (BuildContext context) {
          return new Modal();
        });
    if (item != null) {
      setState(() {
        items.add(item);
      });
    }
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      items.sort((a, b) {
        if (a.iSDone && !b.iSDone)
          return 1;
        else if (a.iSDone && b.iSDone) return -1;
        return 0;
      });
    });
    return Future.value();
  }
}
