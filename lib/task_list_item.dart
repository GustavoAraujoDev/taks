import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  final String task;
  final Function() onDelete;
  final Function() onComplete;

  TaskListItem({
    required this.task,
    required this.onDelete,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: onComplete,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
