import "package:flutter/material.dart";
import 'package:firstapp/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function deleteTodo;
  final Function toggleTodo;
  const TodoList(
      {Key? key,
      required this.todos,
      required this.deleteTodo,
      required this.toggleTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(
            bottom: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[50],
          ),
          child: Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 18,
                      color: Colors.red[500],
                    ),
                    onPressed: () {
                      deleteTodo(index);
                    },
                  ),
                  value: todos[index].isDone,
                  title: Text(
                    todos[index].task,
                    style: TextStyle(
                      color: todos[index].isDone
                          ? Colors.grey[600]
                          : Colors.grey[800],
                      decoration: todos[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 15,
                    ),
                  ),
                  onChanged: (bool? value) {
                    toggleTodo(value, index);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
