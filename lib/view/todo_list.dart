import 'package:aeione_task/model/todo.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({Key key, this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text(
                      todos[index].userId.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        "ID:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        todos[index].id.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      )
                    ],
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      todos[index].title.toUpperCase(),
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.blueAccent),
                    ),
                  ),
                  trailing: todos[index].completed
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.timer,
                          color: Colors.yellow,
                        ),
                ),
              ),
            );
          }),
    );
  }
}
