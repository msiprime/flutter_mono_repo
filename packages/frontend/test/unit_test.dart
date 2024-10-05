import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/data/remote_task_repo.dart';

void main() async {
  test('Fetching all the task from backend test', () async {
    final data = await RemoteTaskRepo().fetchAllTasks();
    expect(data.length, 2);
  });
}
