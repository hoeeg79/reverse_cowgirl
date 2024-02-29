import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:reverse_cowgirl/rpn_calc.dart';

void main (){

  //Tests for the addition command
  group('addCommand',(){
    test('Checks if the number gets added works', (){
      final stack = [1, 2];
      AddCommand().apply(stack, []);
      expect(stack, [3]);
    });

    test('Checks it only uses the two last numbers in a stack.', (){
      final stack = [1, 2, 3];
      AddCommand().apply(stack, []);
      expect(stack, [1, 5]);
    });

    test('Checks if the undo button removes a stack',(){
      final stack = [1, 2, 3];
      final List<num> history = [];
      AddCommand().apply(stack, history);
      print('stack' + stack.toString());
      print(history);
      UndoCommand().apply(stack, history);
      expect(stack, [1, 2, 3]);
    });
  });
  //Tests for the subtraction command
  group('subtractCommand',(){
    test('Checks if the number subtraction works',(){
      final stack = [3, 4];
      SubtractCommand().apply(stack, []);
      expect(stack, [1]);
    });

    test('Checks it only uses the two last numbers in a stack', (){
      final stack = [4, 1, 2];
      SubtractCommand().apply(stack, []);
      expect(stack, [4, 1]);
    });
  });
  //Tests for the multiplication command
  group('multiplicationCommand', () {
    test('Checks if the number multiplication works',(){
      final stack = [2,2];
      MultiplicationCommand().apply(stack, []);
      expect(stack, [4]);
    });

    test('checks it only uses the two last numbers in a stack',(){
      final stack = [2,2,2];
      MultiplicationCommand().apply(stack, []);
      expect(stack, [2, 4]);
    });
  });
  //Tests for the division command
  group('divisionCommand', () {
    test('Checks if the number divide works',(){
      final stack = [2.0, 4.0];
      DivisionCommand().apply(stack, []);
      expect(stack, [2.0]);
    });

    test('Checks it only uses the two last numbers in a stack',(){
      final stack = [2.0, 4.0, 8.0];
      DivisionCommand().apply(stack, []);
      expect(stack, [2.0, 2.0]);
    });
  });

  group('SquareRootCommand', () {
    test('Checks if the Square root of a number works.',(){
        final stack = [4.0];
        SquareRootCommand().apply(stack, []);
        expect(stack, [2.0]);
    });
  });

  group('SquareCommand', () {
    test('Checks if the Square of a number works',(){
      final stack = [23.0];
      SquareCommand().apply(stack, []);
      expect(stack, [529.0]);
    });
  });
}