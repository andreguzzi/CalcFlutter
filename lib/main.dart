import 'package:flutter/material.dart';

void main() => runApp(SimpleCalc());

class SimpleCalc extends StatefulWidget {
  SimpleCalc({Key? key}) : super(key: key);

  @override
  _SimpleCalcState createState() => _SimpleCalcState();
}

class _SimpleCalcState extends State<SimpleCalc> {
  String resultado = '';
  double num1 = 0.0;
  double num2 = 0.0;

  @override
  Widget build(BuildContext context) {
    TextField n1 = TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.deepOrange),
        decoration: InputDecoration(
          labelText: 'Numero 01',
          labelStyle: TextStyle(color: Colors.deepOrange),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
        ),
        onChanged: (value) => num1 = double.parse(value));

    Padding clearfix = Padding(padding: EdgeInsets.all(5.0));

    TextField n2 = TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.deepOrange),
      decoration: InputDecoration(
        labelText: 'Numero 02',
        labelStyle: TextStyle(color: Colors.deepOrange),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
      ),
      onChanged: (value) => num2 = double.parse(value),
    );

    RaisedButton btn = RaisedButton(
      onPressed: () {
        setState(() {
          double calc = num1 + num2;
          this.resultado =
              "O resultado da soma dos valores é : ${calc.toStringAsFixed(2)}";
        });
      },
      child: Text('Somar'),
      color: Colors.deepOrange,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );

    Text resultado = Text(
      this.resultado,
      style: TextStyle(color: Colors.deepOrangeAccent),
    );

    Column cols = Column(
      children: <Widget>[
        n1,
        clearfix,
        n2,
        clearfix,
        SizedBox(child: btn, width: double.infinity),
        clearfix,
        resultado,
      ],
    );
    return MaterialApp(
      title: 'Simple Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: cols,
        ),
      ),
    );
  }
}
