import 'package:flutter/material.dart';

class RegistryPage extends StatelessWidget {
  const RegistryPage({super.key});


  Widget inputs() {
    return Column(
      children: [
        Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        labelText: 'Usuário',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.orange,
                        suffixIcon:
                            Icon(Icons.person_outline, color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.orange,
                        suffixIcon:
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.orange,
                        suffixIcon: Icon(Icons.lock_outline, color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
            Container(
              child: inputs(),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: MaterialButton(
                onPressed: () => Navigator.of(context).pop('/login'),
                child: Text('Cadastrar-se'),
                color: Colors.orange,
                textColor: Colors.white,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
            )
    
        ],
      ),
    );
  }
}
