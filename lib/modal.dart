import 'package:app_flutter/models/item.dart';
import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  final itemC = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Item'),
      content: TextField(
        autofocus: true,
        controller: itemC,
      ),
      actions: <Widget>[
        new FlatButton(
          child: Text('cancelar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        new FlatButton(
            onPressed: () {
              final item = new Item(title: itemC.value.text);
              itemC.clear();
              Navigator.of(context).pop(item);
            },
            child: Text('Add'))
      ],
    );
  }
}
