import 'dart:math';

abstract class Command {
  void apply(List<num> stack);
}

class AddCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = stack.removeLast() + stack.removeLast() ;
    stack.add(result);
  }
}

class SubtractCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = stack.removeLast() - stack.removeLast() ;
    stack.add(result);
  }
}

class MultiplicationCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = stack.removeLast() * stack.removeLast() ;
    stack.add(result);
  }
}

class DivisionCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = stack.removeLast() / stack.removeLast() ;
    stack.add(result);
  }
}

class SquareRootCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = sqrt(stack.removeLast());
    stack.add(result);
  }
}

class SquareCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = pow(stack.removeLast(), 2);
    stack.add(result);
  }
}

class Calculator{
  final List<num> stack = [];
  push(num value){
    stack.add(value);
  }
  execute(Command command){
    command.apply(stack);
  }
  reset(){
    stack.clear();
  }
}

