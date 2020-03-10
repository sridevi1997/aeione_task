class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo(this.id, this.userId, this.title, this.completed);

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        completed = json['completed'];
}
