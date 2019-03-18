import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'app_model.dart';

class ModelTwo extends StatelessWidget {

  AppModel model1 = AppModel();
  AppModel model2 = AppModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('more complex model'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ScopedModel<AppModel>(
              model: model1,
              child: Counter('Model 1 counter'),
            ),
            ScopedModel<AppModel>(
              model: model2,
              child: Counter('Model 2 counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final String _title;

  Counter(this._title);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_title),
          Text(
            model.counter.toString(),
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          ButtonBar(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_drop_up), onPressed: model.increment),
              IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: model.decrement),
            ],
          )
        ],
      );
    });
  }
}
