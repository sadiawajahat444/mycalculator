import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";
   Widget btn(String texttt) {
    return Expanded(
          child: OutlineButton(
            padding: EdgeInsets.all(25.0),
          onPressed: () {
            abc(texttt);
          },
          child: Text(texttt,style: TextStyle(fontSize: 20.0,)
          )),
    );
  }

  abc(texttt) {
    setState(() {
      result = result + texttt;
    });
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Calculator"),
        ),),
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         // SizedBox(
          //  height: 300,
          //),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "$result",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
         /* SizedBox(
           height: 50,
         ),*/
          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("+"),
            ],
          ),
          Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("4"),
              btn("5"),
              btn("6"),
              btn("-"),
            ],
          ),
          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("7"),
              btn("8"),
              btn("9"),
              btn("*"),
            ],
          ),
          Row(
            
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              
             btn("0"),
              btn("/"),
              ElevatedButton(
                onPressed: output, child: Text('=',style: TextStyle(fontSize: 20.0,),),
                style: ElevatedButton.styleFrom(
                
                  primary: Colors.black,
                  padding: EdgeInsets.all(27.0)
                  ),
                
                ),
              ElevatedButton(onPressed: clearr, child: Text('Clear',style: TextStyle(fontSize: 20.0,),),
              style: ElevatedButton.styleFrom(
                 // primary: Colors.black,
                  padding: EdgeInsets.all(26.0)
              ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
