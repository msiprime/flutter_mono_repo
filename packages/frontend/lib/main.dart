import 'package:flutter/material.dart';
import 'package:frontend/core/data/remote_task_repo.dart';
import 'package:frontend/widgets/task_list.dart';
import 'package:shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await printData();
  runApp(const MyApp());
}

Future<void> printData() async {
  final data = await RemoteTaskRepo().fetchAllTasks();
  print(data.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TaskList(tasks: [
              Task(id: '1', title: 'Task 1', isCompleted: false),
              Task(id: '2', title: 'Task 2', isCompleted: false),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add a new task',
                ),
              ),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
