import 'dart:async';

main() {
  /* myStreamFunction().listen((a) {
    print(a * a);
  });
*/
  StreamController _myStreamController = StreamController();
  void functionForStreamController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      if (i == 5) {
        _myStreamController.addError('error');
      }
      _myStreamController.sink.add(i + 2);
    }
    _myStreamController.close();
  }

  functionForStreamController();
  _myStreamController.stream.listen((event) {
    print(event * 30);
  }, onDone: () {
    print('Stream listen içerisinde onDone fonksiyonu çalıştı.');
  }, onError: (error) {
    print(error);
  }, cancelOnError: true);
}

Stream<int> myStreamFunction() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i + 1;
  }
}
