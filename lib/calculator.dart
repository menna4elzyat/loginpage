import 'package:flutter/material.dart';



class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _height = 160; // initial height in centimeters
  double _weight = 60; // initial weight in kilograms
  int _age = 30; // initial age
  bool _isMaleSelected = true;
  double _bmi = 0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
      _showBMIResult();
    });
  }

  void _increaseAge() {
    setState(() {
      _age++;
    });
  }
  void _showBMIResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('BMI Result'),
          content: Text('Your BMI is ${_bmi.toStringAsFixed(2)}.'),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _decreaseAge() {
    setState(() {
      if (_age > 1) {
        _age--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radiobutton("male", Colors.black, 0,
                  ),
                  radiobutton("female", Colors.pink, 0),


                ],
              ),
              SizedBox(height: 40),
              Text(
                'Enter your height (cm):',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Slider(
                value: _height,
                min: 100,
                max: 250,
                onChanged: (newValue) {
                  setState(() {
                    _height = newValue;
                  });
                },
              ),
              Text(
                'Enter your weight (kg):',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Slider(
                value: _weight,
                min: 30,
                max: 200,
                onChanged: (newValue) {
                  setState(() {
                    _weight = newValue;
                  });
                },
              ),
              Text(
                'Enter your age:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decreaseAge,
                    child: Text('-'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '$_age',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _increaseAge,
                    child: Text('+'),
                  ),

                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 16),
              Text(
                'BMI: ${_bmi.toStringAsFixed(3)}',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void change(int index){
    setState(() {
      var currentindex=index;
    });

  }
  Widget radiobutton(String value,Color color,int index){
    return Expanded(child: Container(
      margin:const EdgeInsets.symmetric(horizontal: 12),
      height: 80,
      child:  ElevatedButton(
        onPressed: (){
          change(index);
        },
        child: Text(value,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),

      ),


    ));
  }
}