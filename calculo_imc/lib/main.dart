// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
// // ignore: prefer_const_literals_to_create_immutables

// import 'dart:ffi';

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       final String text = _controller.text.toLowerCase();
//       _controller.value = _controller.value.copyWith(
//         text: text,
//         selection:
//             TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing: TextRange.empty,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   String imageImcNormal = 'assets/normal.jpg';
//   String imageImcMagreza = 'assets/magreza.jpg';
//   String imageImcExcesso = 'assets/excesso.jpg';
//   String imageImcObesidade = 'assets/obesidade.jpg';
//   String imageImcObesidade2 = 'assets/obesidade2.jpg';
//   String chosenImage = '';

//   double imc = 0.0;
//   double altura = 0.0;
//   double peso = 0.0;

  
//   void calculaImc() {

//     imc = peso / (altura * altura);

//     switch(imc) {               
                
//     case num==18: { 

//     chosenImage = imageImcExcesso;
//       // statements; 
//    } 
//     break; 

//     case imc = <25: { 

//     chosenImage = imageImcMagreza;
//       // statements; 
//    } 
//     break; 

//     case imc = <30: { 

//     chosenImage = imageImcNormal;
//       // statements; 
//    } 
//     break; 

//     case imc = <35: { 

//     chosenImage = imageImcObesidade;
//       // statements; 
//    } 
//     break; 
  
//     case imc = >35: { 

//    chosenImage = imageImcObesidade2;
//       // statements; 
//    } 
//     break; 
      
//     default: { 

//       imageImcNormal; 
      
//    }
//     break; 
//   }

//     print('IMC');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           primarySwatch: Colors.teal, scaffoldBackgroundColor: Colors.white),
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text('Calculadora de IMC'),
//         ),
//         body: Column(children: [
//           Flexible(
//               // flex: 2,
//               child: Container(
//             margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             // color: Colors.black54,

//             child: Column(
//                 // crossAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextFormField(
//                     controller: _controller,
//                     keyboardType:
//                         TextInputType.numberWithOptions(decimal: true),
//                     decoration: InputDecoration(
//                         hintText: 'Altura', labelText: 'Insira sua altura:'),
//                   ),
//                   TextFormField(
//                     controller: _controller,
//                     keyboardType:
//                         TextInputType.numberWithOptions(decimal: true),
//                     decoration: InputDecoration(
//                         hintText: 'Peso:', labelText: 'Insira seu peso'),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 30),
//                     width: double.infinity,
//                     height: 40,
//                     child: ElevatedButton(
//                       child: Text('Calcular IMC'),
//                       onPressed:
//                           calculaImc, // ---> onPressed: () => calculaImc(),
//                     ),
//                   ),
//                 ]),
//           )),
//           Flexible(
//             child: Container(
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
//               // color: Colors.amber[600],
//               child: Image.asset(               
//                 chosenImage,
//                 scale: 0.7,
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
