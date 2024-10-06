import 'package:flutter/material.dart';
import 'package:frontend/core/data/remote_task_repo.dart';
import 'package:frontend/core/mutation/fetch_all_task.dart';
import 'package:frontend/core/store/task_store.dart';
import 'package:frontend/screens/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await printData();
  runApp(
    VxState(
      store: TaskStore(),
      child: const MyApp(),
    ),
  );
}

Future<void> printData() async {
  final data = await RemoteTaskRepo().fetchAllTasks();
  print(data.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetAllTaskMutation();
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
