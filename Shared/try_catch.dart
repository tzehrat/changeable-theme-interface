import 'try_catch.dart';

main() {
/*  try {
    birFonksiyon(99996);
  } on ExceptionTypeA {
    print('A tipi hata');
  } on ExceptionTypeB {
    print('B tipi hata');
  } catch (errr) {
    print(errr);
  } finally {
    print('dghjk');
  } */
  try {
    birFonksiyon(4567);
  } catch (err) {
    print('hatayklndı $err');
  }
}

void birFonksiyon(int numara) {
  if (numara < 100) {
    print(numara);
  } else {
    throw Exception('hataa');
  }
}

class ExceptionTypeA implements Exception {}

class ExceptionTypeB implements Exception {}

void araFonksiyon(int numara) {
  try {
    birFonksiyon(numara);
  } catch (err) {
    print('arafon hata yakaladı $err');
    rethrow;
  }
}
