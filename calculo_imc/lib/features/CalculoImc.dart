import 'package:calculo_imc/core/taxa_imc.dart';
import 'package:flutter/material.dart';
import 'package:calculo_imc/core/asset_image_local.dart';

class CalculoImc extends StatefulWidget {
  const CalculoImc({Key? key}) : super(key: key);

  State<CalculoImc> createState() => _CalculoImcState();
}

class _CalculoImcState extends State<CalculoImc> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  String current_image = AssetImageLocal.normal;

  void calcularImc() {
    double altura = double.parse(alturaController.text);
    double peso = double.parse(pesoController.text);
    double resultado = peso / (altura * altura);
    String image_to_show = AssetImageLocal.normal;

    if (resultado < TaxaIMC.abaixoPeso)
      image_to_show = AssetImageLocal.magreza;
    else if (TaxaIMC.abaixoPeso < resultado && resultado < TaxaIMC.pesoNormal)
      image_to_show = AssetImageLocal.normal;
    else if (TaxaIMC.pesoNormal < resultado && resultado < TaxaIMC.sobrePeso)
      image_to_show = AssetImageLocal.excesso;
    else if (TaxaIMC.sobrePeso < resultado && resultado < TaxaIMC.obesidade)
      image_to_show = AssetImageLocal.obesidade;
    else
      image_to_show = AssetImageLocal.obesidade2;

    setState(() {
      current_image = image_to_show;
    });
  }

  /*@override 
  void initState(){
    super.initState(); 
    calcularImc(); // Alternativa para inicialização da variável sem valor. 
  }*/

  @override
  void dispose() {
    alturaController.dispose();
    pesoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          // appBarTheme: AppBarTheme(
          //     iconTheme: IconThemeData(color: Colors.black),
          //     color: Colors.deepPurpleAccent),
          scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
        ),
        body: Column(children: [
          Flexible(
              // flex: 2,
              child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            // color: Colors.black54,
            child: Column(
                // crossAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: alturaController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        hintText: 'Altura', labelText: 'Insira sua altura:'),
                  ),
                  TextFormField(
                    controller: pesoController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        hintText: 'Peso:', labelText: 'Insira seu peso'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      child: Text('Calcular IMC'),
                      onPressed: calcularImc,
                    ),
                  ),
                ]),
          )),
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
              // color: Colors.amber[600],
              child: Image.asset(
                'assets/' + current_image,
                scale: 0.75,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
