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
  String lastResult = '';

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
                    inputNumber.isEmpty
                        ? 'Enter a number'
                        : inputNumber.toString(),
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                Center(
                  child: Text(
                    calculator.stack.isEmpty ? '' : lastResult,
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
                      lastResult = calculator.stack.last.toString();
                    });
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(subtractCommand);
                      lastResult = calculator.stack.last.toString();
                    });
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(multiplicationCommand);
                      lastResult = calculator.stack.last.toString();
                    });
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(divisionCommand);
                      lastResult = calculator.stack.last.toString();
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
                      lastResult = calculator.stack.last.toString();
                    });
                  },
                  child: const Text('√'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.execute(squareCommand);
                      lastResult = calculator.stack.last.toString();
                    });
                  },
                  child: const Text('x²'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator.stack.clear();
                      inputNumber = '';
                      lastResult = '';
                    });
                  },
                  child: const Text('C'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 300,
              width: 300,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1.4,
                ),
                children: [
                  for (var i = 1; i < 10; i++)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (numberTyped) {
                            inputNumber += i.toString();
                          } else {
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
                        if (numberTyped) {
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
                        inputNumber = '';
                      });
                    },
                    child: const Text('Enter'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
