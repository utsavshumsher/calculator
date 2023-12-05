import 'package:calculator_app/view/btn.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  /////////////////
  ///////////

  String number1 = ''; //0-9
  String operand = ''; // +-*/
  String number2 = ''; //0-9

  Widget _button(value, Color btntcolor, Color txtcolor) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(3),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  minimumSize: const Size(90, 100),
                  backgroundColor: btntcolor),
              onPressed: () {
                _onBtnTap(value);
              },
              child: Text(
                value,
                style: TextStyle(color: txtcolor, fontSize: 29),
              )),
        )
      ],
    );
  }

  ///
  ///

  Widget _operators(
    operatornum,
    Color operatebtnColor,
    Color operatetxtColor,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              minimumSize: const Size(90, 100),
              backgroundColor: operatebtnColor),
          onPressed: () {
            // _onBtnTap(operatornum);
          },
          child: Text(
            operatornum,
            style: TextStyle(fontSize: 29, color: operatetxtColor),
          )),
    );
  }

  ///////////////////////
  ///
  ///

  void _onBtnTap(value) {
    setState(() {
      if (isDigit(value)) {
        if (operand.isEmpty) {
          number1 += value;
        } else {
          number2 += value;
        }
      } else {
        operand += value;
      }
    });
    // setState(() {
    //   number1 += value;
    //   operand += value;
    //   number2 += value;
    // });
  }

  bool isDigit(String value) {
    return double.tryParse(value) != null;
  }

  final _gap = const SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Calculator',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "$number1$operand$number2".isEmpty
                              ? "0"
                              : "$number1$operand$number2",
                          style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _gap,
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  children: [
                    _operators(Btn.del, Colors.red, Colors.white),
                    _operators(Btn.clear, Colors.grey, Colors.white),
                    _operators(Btn.per, Colors.grey, Colors.white),
                    _operators(Btn.divide, Colors.amber.shade700, Colors.white),
                    _button(Btn.n7, Colors.grey, Colors.white),
                    _button(Btn.n8, Colors.grey, Colors.white),
                    _button(Btn.n9, Colors.grey, Colors.white),
                    _operators(
                        Btn.multiply, Colors.amber.shade700, Colors.white),
                    _button(Btn.n4, Colors.grey, Colors.white),
                    _button(Btn.n5, Colors.grey, Colors.white),
                    _button(Btn.n6, Colors.grey, Colors.white),
                    _operators(
                        Btn.subtract, Colors.amber.shade700, Colors.white),
                    _button(Btn.n1, Colors.grey, Colors.white),
                    _button(Btn.n2, Colors.grey, Colors.white),
                    _button(Btn.n3, Colors.grey, Colors.white),
                    _operators(Btn.add, Colors.amber.shade700, Colors.white),
                    _button(Btn.n0, Colors.grey, Colors.white),
                    _button(Btn.dot, Colors.grey, Colors.white),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                            backgroundColor: Colors.red),
                        onPressed: () {},
                        child: const Text(
                          'cut',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    _operators(
                        Btn.calculate, Colors.amber.shade700, Colors.white)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
