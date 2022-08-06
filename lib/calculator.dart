import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor){
   return ElevatedButton(onPressed: () => {calculate(btnText)}, child: Text(
     btnText,
     style: TextStyle(
       fontSize: 25,
       color: txtColor,
     ),
   ),
     style: ElevatedButton.styleFrom(
       fixedSize: Size(70, 70),
       shape: CircleBorder(),
       primary: btnColor,
     ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Calculator"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.all(10.0),
                  child: Text(text, style: TextStyle(color: Colors.white, fontSize: 80),textAlign: TextAlign.left,) ,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton("C", Colors.grey, Colors.black),
                  numButton("+/-", Colors.grey, Colors.black),
                  numButton("%", Colors.grey, Colors.black),
                  numButton("/", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton("7", (Colors.grey[850])!, Colors.black),
                  numButton("8", (Colors.grey[850])!, Colors.black),
                  numButton("9", (Colors.grey[850])!, Colors.black),
                  numButton("X", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton("4", (Colors.grey[850])!, Colors.black),
                  numButton("5", (Colors.grey[850])!, Colors.black),
                  numButton("6", (Colors.grey[850])!, Colors.black),
                  numButton("-", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton("3", (Colors.grey[850])!, Colors.black),
                  numButton("2", (Colors.grey[850])!, Colors.black),
                  numButton("1", (Colors.grey[850])!, Colors.black),
                  numButton("+", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){}, child: Padding(
                    padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                    child: Text("0", style: TextStyle(fontSize: 35, color: Colors.white),),
                  ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: (Colors.grey[850])!,
                    ),
                  ),
                  numButton(".", (Colors.grey[850])!, Colors.white),
                  numButton("=", Colors.orange,  Colors.white),
                ],
              ),
              SizedBox(height: 10,)
            ]
          ),
        )
    );
  }
  int firstNumber = 0;
  int secoundNumber = 0;
  String result = "";
  String text = "";
  String operation = "";
  void calculate(String btnText){
    if(btnText == "C"){
       result = "";
       text = "";
       firstNumber = 0;
       secoundNumber = 0;
    }else if (btnText == "+" || btnText == "-" || btnText== "x" || btnText == "/"){
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    }else if(btnText == "="){
      secoundNumber = int.parse(text);
      if(operation == "+"){
        result = (firstNumber + secoundNumber).toString();
      }if(operation == "-"){
        result = (firstNumber - secoundNumber).toString();
      }if(operation == "x"){
        result = (firstNumber * secoundNumber).toString();
      }if(operation == "/"){
        result = (firstNumber ~/ secoundNumber).toString();
      }
    }
    else{
      result = int.parse(text + btnText).toString();
    }
    setState(() {
     text = result;
    });
  }

}
