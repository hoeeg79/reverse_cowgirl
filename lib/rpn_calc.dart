import 'dart:math';

abstract class Command {
  void apply(List<num> stack, List<num> history);
}

class AddCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    num n1 = stack.removeLast();
    num n2 = stack.removeLast();
    var result = n1 + n2;
    List<num> usedNumbers = [n1, n2];
    stack.add(result);
    history = usedNumbers;
  }
}

class SubtractCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    var result = stack.removeLast() - stack.removeLast() ;
    stack.add(result);
  }
}

class MultiplicationCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    var result = stack.removeLast() * stack.removeLast() ;
    stack.add(result);
  }
}

class DivisionCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    var result = stack.removeLast() / stack.removeLast() ;
    stack.add(result);
  }
}

class SquareRootCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    var result = sqrt(stack.removeLast());
    stack.add(result);
  }
}

class SquareCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    var result = pow(stack.removeLast(), 2);
    stack.add(result);
  }
}

class UndoCommand implements Command {
  @override
  void apply(List<num> stack, List<num> history) {
    stack.removeLast();
    stack.add(history.removeLast());
    stack.add(history.removeLast());
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

