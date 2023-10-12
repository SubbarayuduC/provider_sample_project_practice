import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'itemsList.dart';
import 'model/item.dart';
import 'model/item_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String newItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                newItem = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter Item',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (newItem.isNotEmpty) {
                Provider.of<ItemData>(context, listen: false)
                    .addItem(Item(item: newItem));
                setState(() {
                  newItem = '';
                });
              }
            },
            child: Text('Submit'),
          ),
          Expanded(
            child: ItemList(),
          ),
        ],
      ),
    );
  }
}