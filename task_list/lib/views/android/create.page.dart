import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Tarefa'),
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Salvar nova tarefa'),
            ),
          )
        ],
      )),
    );
  }
}
