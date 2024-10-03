import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared/shared.dart';

class RemoteTaskRepo implements TaskRepo {
  final client = http.Client();
  final String baseUrl = 'http://10.0.2.2:8080';

  // for android emulator
  // we are gonna have to use 10.0.2.2 instead of local host. fuck

  @override
  Future<List<Task>> fetchAllTasks() async {
    final response = await client.get(
      Uri.parse('$baseUrl/tasks'),
    );

    final jsonResponse = json.decode(response.body);
    final List<Task> tasks =
        jsonResponse.map<Task>((task) => Task.fromJson(task)).toList();
    return tasks;
  }

  @override
  Future<Task> getTaskById(String id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/tasks/$id'),
    );

    final jsonResponse = json.decode(response.body);

    final Task task = Task.fromJson(jsonResponse);

    return task;
  }

  @override
  Future<Task> addTask(Task task) async {
    final response = await client.post(
      Uri.parse('$baseUrl/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(task.toJson()),
    );

    final jsonResponse = json.decode(response.body);

    final Task newTask = Task.fromJson(jsonResponse);

    return newTask;
  }

  @override
  Future<Task> deleteTaskById(String id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/tasks/$id'),
    );

    final jsonResponse = json.decode(response.body);

    final Task task = Task.fromJson(jsonResponse);

    return task;
  }

  @override
  Future<Task> updateTask(Task task) async {
    final response = await client.put(
      Uri.parse('$baseUrl/tasks/${task.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(task.toJson()),
    );

    final jsonResponse = json.decode(response.body);

    final Task updatedTask = Task.fromJson(jsonResponse);

    return updatedTask;
  }
}
