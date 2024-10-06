import 'package:flutter/material.dart';
import 'package:frontend/core/mutation/fetch_all_task.dart';
import 'package:frontend/core/store/task_store.dart';
import 'package:frontend/widgets/task_list_view.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),
      body: VxBuilder(
        mutations: const {GetAllTaskMutation},
        builder: (context, store, status) => Column(
          children: [
            Expanded(
              child: status == VxStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : TaskListView(tasks: (store as TaskStore).tasks),
            ),
          ],
        ),
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
