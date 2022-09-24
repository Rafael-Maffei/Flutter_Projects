// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:task_list/controllers/task.controller.dart';

class ListPage extends StatelessWidget {
  final taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: [],
      ),
      body: ListView.builder(
        itemCount: taskController.read().length,
        itemBuilder: (_, index) {
          final task = taskController.read()[index];
          return CheckboxListTile(
            value: task.finished,
            onChanged: null,
            title: Text(task.name!),
          );
        },
      ),
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/create'),
        child: Icon(Icons.add),
      ),
    );
  }
}
