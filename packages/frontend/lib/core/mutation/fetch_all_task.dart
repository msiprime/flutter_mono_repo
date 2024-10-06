import 'package:frontend/core/data/remote_task_repo.dart';
import 'package:frontend/core/store/task_store.dart';
import 'package:velocity_x/velocity_x.dart';

class GetAllTaskMutation extends VxMutation<TaskStore> {
  @override
  perform() async {
    final tasks = await RemoteTaskRepo().fetchAllTasks();
    store!.tasks = tasks;
  }
}
