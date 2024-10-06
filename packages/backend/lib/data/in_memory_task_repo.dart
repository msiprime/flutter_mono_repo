import 'package:shared/shared.dart';

/// In-memory implementation of [TaskRepo].

class InMemoryTaskRepo implements TaskRepo {
  final List<Task> _data = [
    Task(id: 's', title: 'Task 1', isCompleted: false),
    Task(id: 'sa', title: 'Task 2', isCompleted: false),
    Task(id: 'sak', title: 'Task 3', isCompleted: false),
  ];

  List<Task> get tasks => _data;

  @override
  Future<Task> addTask(Task task) async {
    final newTask = task.copyWith(id: '${_data.length + 1}');
    _data.add(newTask);
    return newTask;
  }

  @override
  Future<Task> deleteTaskById(String id) async {
    final task = _data.firstWhere((task) => task.id == id);
    _data.remove(task);
    return task;
  }

  @override
  Future<List<Task>> fetchAllTasks() async {
    return _data;
  }

  @override
  Future<Task> getTaskById(String id) async {
    final task = _data.firstWhere((task) => task.id == id);
    return task;
  }

  @override
  Future<Task> updateTask(Task task) {
    final index = _data.indexWhere((t) => t.id == task.id);
    _data[index] = task;
    return Future.value(task);
  }
}
