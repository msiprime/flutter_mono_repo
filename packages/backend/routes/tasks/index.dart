import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:shared/shared.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => await _onGet(context),
    HttpMethod.post => await _onPost(context),
    _ => Response(statusCode: HttpStatus.notFound),
  };
}

Future<Response> _onGet(RequestContext context) async {
  final tasks = await context.read<TaskRepo>().fetchAllTasks();
  final json = tasks.map((task) => task.toJson()).toList();
  return Response.json(body: json);
}

Future<Response> _onPost(RequestContext context) async {
  final json = await context.request.json() as Map<String, dynamic>;
  final task = Task.fromJson(json);
  // final task = context.read<TaskRepo>().addTask(Task.fromJson(json));
  final addedTask = await context.read<TaskRepo>().addTask(task);
  return Response.json(body: addedTask.toJson());
}
