import 'package:flutter/material.dart';
import 'package:frontend/core/data/remote_task_repo.dart';

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
      body: const Center(
        child: Text('Welcome to Task App'),
      ),
    );
  }
}
