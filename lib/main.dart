import 'package:firstapp/todos_list.dart';
import "package:flutter/material.dart";
import "package:firstapp/todo.dart";
import "package:firstapp/todo_input.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        fontFamily: "SpaceMono",
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [];

  Future<void> openDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return TodoInput(addTodo: addTodo);
      },
    );
  }

  void deleteTodo(index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void addTodo(todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void toggleTodo(value, index) {
    setState(() {
      todos[index].isDone = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          "Simple todo app",
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await openDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
        // color: Colors.grey[200],
        child: todos.isEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No todos for now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              )
            : TodoList(
                todos: todos,
                deleteTodo: deleteTodo,
                toggleTodo: toggleTodo,
              ),
      ),
    );
  }
}
