import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/tasks_bloc.dart';
import 'package:flutter_tasks_app/model/task.dart';
import 'package:flutter_tasks_app/widgets/tasks_list.dart';
import '../blocs/bloc_exports.dart';

class PendingTasksScreen extends StatefulWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> _tasksList = state.pendingTasks;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${_tasksList.length} Tasks:',
                  ),
                ),
              ),
              TasksList(taskList: _tasksList),
            ],
          ),
        );
      },
    );
  }
}
