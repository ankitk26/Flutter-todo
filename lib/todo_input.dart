import "package:flutter/material.dart";
import "todo.dart";

class TodoInput extends StatefulWidget {
  final Function addTodo;
  const TodoInput({Key? key, required this.addTodo}) : super(key: key);

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(
        right: 10,
      ),
      title: const Text(
        "Add new todo",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      content: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: taskController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(
          labelText: "Enter task",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        ElevatedButton(
          onPressed: () {
            if (taskController.text != "") {
              Todo newTodo = Todo(task: taskController.text);
              widget.addTodo(newTodo);
              taskController.text = "";
              Navigator.of(context).pop();
            }
          },
          child: const Text(
            "Submit",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
