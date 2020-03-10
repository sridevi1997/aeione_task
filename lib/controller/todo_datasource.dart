import 'dart:async';
import 'dart:convert';

import 'package:aeione_task/constants/api.dart';
import 'package:aeione_task/model/todo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Todo>> fetchTodos(http.Client client) async {
  final response =
  await client.get(Api.URL);

  // Use the compute function to run parseTodo in a separate isolate.
  return compute(parseTodos, response.body);
}

// A function that converts a response body into a List<Todos>.
List<Todo> parseTodos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
}