import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:reverse_cowgirl/rpn_calc.dart';

void main (){
  group('addCommand',(){
    test('Checks if the number gets added works', (){
      final stack = [1, 2];
      AddCommand().apply(stack);
      expect(stack, [3]);
    });

    test('Checks it only uses the two last numbers in a stack.', (){
      final stack = [1, 2, 3];
      AddCommand().apply(stack);
      expect(stack, [1, 5]);
    });
  });

  group('subtractCommand',(){
    test('Checks if the number subtraction works',(){
      final stack = [3, 4];
      SubtractCommand().apply(stack);
      expect(stack, [1]);
    });

    test('Checks it only uses the two last numbers in a stack', (){
      final stack = [4, 1, 2];
      SubtractCommand().apply(stack);
      expect(stack, [4, 1]);
    });
  });
}