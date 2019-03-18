import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  increment() {
    _counter++;
    notifyListeners();
  }

  decrement() {
    _counter--;
    notifyListeners();
  }
}
