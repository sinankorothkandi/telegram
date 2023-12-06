// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
  
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_2/Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _UserNameError = '';
  String _PasswordErorr = '';

  
  
  void _login() { 
    String username = _usernameController.text;
    String password = _passwordController.text;

    _UserNameError = '';
    _PasswordErorr = '';

    if (username != "sinan") {
      _UserNameError = "Invalid Username";
    }
    if (password != "12345") {
      _PasswordErorr = "Invalid Password";
    }
    if (username.isEmpty) {
      _UserNameError = "Enter Username";
    }
    if (password.isEmpty) {
      _PasswordErorr = "Enter Password";
    }
    if (_UserNameError.isEmpty && _PasswordErorr.isEmpty) {
      setLoggedIn();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      setState(() {}); 
    }
  }
 
  void setLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 185,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Kanit'),
                    ))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Please sign in to continue',
                    style: TextStyle(color: Colors.black54, fontSize: 19),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person_outlined)),
              ),
            ),
            if (_UserNameError.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Align(alignment: Alignment.centerLeft,
                  child: Text(
                    _UserNameError,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(   
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outlined),
                ),
                obscureText: true,
              ),
            ),
            if (_PasswordErorr.isNotEmpty)
              Padding( padding: EdgeInsets.symmetric(horizontal: 80),
                child: Align( alignment: Alignment.centerLeft,
                  child: Text(
                    _PasswordErorr,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text('FORGOT PASSWORD?',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 12))))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton(
                onPressed: _login,
                child: Text('LOGIN',style: TextStyle(fontSize: 18),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(135, 0, 0, 0),fixedSize: Size(320, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 240),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Don't have an account? Sign up ",
                  style: TextStyle(
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      )
      ),
    );
  }
}

