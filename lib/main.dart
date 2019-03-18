import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'app_model.dart';
import 'model_two.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  AppModel appModel = AppModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: appModel,
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple model screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ModelTwo()));
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('you have pushed the button this many times:'),
            ScopedModelDescendant<AppModel>(
              builder: (BuildContext context, Widget child, AppModel model) {
                return Text(
                  model.counter.toString(),
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
          return ButtonBar(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_drop_up), onPressed: model.increment),
              IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: model.decrement),
            ],
          );
        },
      ),
    );
  }
}
