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

class SubstractCommand implements Command {
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

class DivinationCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = stack.removeLast() / stack.removeLast() ;
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
}

