import 'dart:async';

class Coke {}

class Order {
  String? type;
  Order(this.type);
}

void main() {
  print('hello world');
  final controller = new StreamController();
  final order = new Order('banana');

  final baker =
      new StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    if (cakeType == 'chocolate') {
      sink.add('chocolate cake');
    } else {
      sink.addError('invalid cake type');
    }
  });

  controller.sink.add(order);

  controller.stream.map((order) => order.type).transform(baker).listen(
      (cake) => print('Here is your $cake'),
      onError: (err) => print(err));
}
