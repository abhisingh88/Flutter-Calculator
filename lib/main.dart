import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum;
  int secondnum;
  String textToDisplay = "";
  String res;
  String operatorToPerform;
  void btnClicked(String btnval) {
    if (btnval == "C") {
      textToDisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "/" ||
        btnval == "*") {
      firstnum = int.parse(textToDisplay);
      res = "";
      operatorToPerform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(textToDisplay);
      if (operatorToPerform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatorToPerform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatorToPerform == "*") {
        res = (firstnum * secondnum).toString();
      }
      if (operatorToPerform == "/") {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(textToDisplay + btnval).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textToDisplay",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("C"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("-"),
                custombutton("0"),
                custombutton("="),
                custombutton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
