import 'package:task_list/models/task.model.dart';

class TaskController {
  final tasks = [
    Task('Estudar para a prova', finished: false),
    Task('Estudar mais', finished: true),
    Task('Estudar mais um pouco', finished: false),
    Task('Estudar mais porra', finished: true),
  ];

  void create(Task task) {}

  List<Task> read() {
    return tasks;
  }

  void update(Task task) {}

  void delete(Task task) {}
}
