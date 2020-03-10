import 'package:aeione_task/controller/todo_datasource.dart';
import 'package:aeione_task/model/todo.dart';
import 'package:aeione_task/view/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Future<List<Todo>> todos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: fetchTodos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? TodoList(todos: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
