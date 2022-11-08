// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user = '';
  String password = '';
  bool showPassword = false;

  Widget inputs () {
    return Column(
      children: [
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    onChanged: (text) {
                      user = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.orange,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.orange,
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.white),
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    onChanged: (text) {
                      password = text;
                    },
                    obscureText: showPassword == false ? true : false,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.orange,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.orange,
                      suffixIcon: GestureDetector(
                      child:  Icon(showPassword == false ? Icons.visibility_off: Icons.visibility, color: Colors.white,),
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      ),
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.white),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                 Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/registry'),
                        child: Text(
                          'Cadastrar-se',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),
                  ),   
            ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, 
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[850],
      body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          
          Container(
            child: Text(
              'justSing!',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(child: inputs()),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  
                  MaterialButton(
                    onPressed: () {
                      if (user == 'teste' && password == '123') {
                        Navigator.of(context).pushNamed('/profile');
                      }
                    },
                    child: Text('Login'),
                    color: Colors.orange,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  )
                ],
              ),
            ),
          ),
          ]
      ),
    );
  }
}
