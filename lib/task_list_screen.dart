import 'package:flutter/material.dart';
import 'task_list_item.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    setState(() {
      tasks.add(taskController.text);
      taskController.text = '';
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void completeTask(int index) {
    setState(() {
      tasks[index] = '✅ ${tasks[index]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      body: Column(
        children: [
          TextField(
            controller: taskController,
            decoration: InputDecoration(labelText: 'Nova Tarefa'),
          ),
          ElevatedButton(
            onPressed: addTask,
            child: Text("Adicionar Tarefa"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskListItem(
                  task: tasks[index],
                  onDelete: () => deleteTask(index),
                  onComplete: () => completeTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
