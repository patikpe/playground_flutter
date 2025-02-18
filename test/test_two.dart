import 'package:flutter_test/flutter_test.dart';

void testTwo() {
  group('Testing Two', () {
    test('Just a test', () {
      int stuff = 1;

      expect(stuff, 1);
    });

    test('Just a test 2', () {
      int stuff = 2;

      expect(stuff, 1);
    });
  });
}
