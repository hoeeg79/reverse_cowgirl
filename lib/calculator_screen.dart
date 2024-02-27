import 'package:flutter/material.dart';
import 'package:reverse_cowgirl/rpn_calc.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Calculator calculator = Calculator();
  Command addCommand = AddCommand();
  Command subtractCommand = SubtractCommand();
  Command multiplicationCommand = MultiplicationCommand();
  Command divisionCommand = DivisionCommand();
  Command squareRootCommand = SquareRootCommand();
  Command squareCommand = SquareCommand();
  bool numberTyped = false;
  String inputNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('RPN Calculator'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                //Shows the stack for the user
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      calculator.stack.reversed.join(' '),
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    inputNumber.isEmpty? 'Enter a number' : inputNumber.toString(),
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                Center(
                  child: Text(
                    calculator.stack.isEmpty
                        ? ''
                        : calculator.stack.last.toString(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(addCommand);
                    });
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(subtractCommand);
                    });
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(multiplicationCommand);
                    });
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(divisionCommand);
                    });
                  },
                  child: const Text('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(squareRootCommand);
                    });
                  },
                  child: const Text('√'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(squareCommand);
                    });
                  },
                  child: const Text('x²'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.stack.clear();
                      inputNumber = '';
                    });
                  },
                  child: const Text('C'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 1; i < 10; i++)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if(numberTyped)
                        {
                          inputNumber += i.toString();
                        }
                        else
                        {
                          inputNumber = i.toString();
                          print(inputNumber);
                          numberTyped = true;
                        }
                      });
                    },
                    child: Text(i.toString()),
                  ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(numberTyped)
                      {
                        inputNumber += '0';
                      }
                    });
                  },
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.push(num.parse(inputNumber));
                      numberTyped = false;
                    });
                  },
                  child: const Text('Enter'),
                ),
              ],
            ),
          ],
        ));
  }
}
