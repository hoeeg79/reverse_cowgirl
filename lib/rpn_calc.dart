import 'dart:math';

abstract class Command {
  void apply(List<num> stack, List<num> history);
}

class AddCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    num n1 = stack.removeLast();
    num n2 = stack.removeLast();

    history.add(n1);
    history.add(n2);

    var result = n1 + n2;
    stack.add(result);
  }
}

class SubtractCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    final num n1 = stack.removeLast();
    final num n2 = stack.removeLast();

    history.add(n1);
    history.add(n2);

    var result = n1 - n2;
    stack.add(result);
  }
}

class MultiplicationCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    final num n1 = stack.removeLast();
    final num n2 = stack.removeLast();

    history.add(n1);
    history.add(n2);

    var result = n1 * n2;
    stack.add(result);
  }
}

class DivisionCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    final num n1 = stack.removeLast();
    final num n2 = stack.removeLast();

    history.add(n1);
    history.add(n2);

    var result = n1 / n2;
    stack.add(result);
  }
}

class SquareRootCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    final num n1 = stack.removeLast();

    history.add(n1);

    var result = sqrt(n1);
    stack.add(result);
  }
}

class SquareCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    final num n1 = stack.removeLast();

    history.add(n1);

    var result = pow(n1, 2);
    stack.add(result);
  }
}

class UndoCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    stack.removeLast();
    for (var number = 0; number < history.length; number++) {
      stack.add(history.removeLast());
    }
  }
}

class Calculator{
  final List<num> stack = [];
  final List<num> history = [];
  push(num value){
    stack.add(value);
  }
  execute(Command command){
    command.apply(stack, history);
  }
  reset(){
    stack.clear();
  }
}

