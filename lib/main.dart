import 'package:flutter/material.dart';

import 'calculator.dart';
void main(){
  runApp(home());
}
class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     home:LoginPage()
   );
  }

}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _message = '';

  void _validateLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Please enter both username and password.';
      });
    } else if (username == 'menna' && password == '1234') {
      setState(() {
        _message = 'Login successful!';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BMICalculatorApp (),
          ),
        );
      });
      // Perform further actions such as navigating to next screen
    } else {
      setState(() {
        _message = 'Invalid username or password.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _validateLogin,
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            Text(
              _message,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}