import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/tasks_bloc.dart';
import 'package:flutter_tasks_app/model/task.dart';
import 'package:flutter_tasks_app/widgets/tasks_list.dart';
import '../blocs/bloc_exports.dart';

class FavouriteTasksScreen extends StatelessWidget {
  const FavouriteTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favouriteTasks;
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      '${tasksList.length} Tasks:',
                    ),
                  ),
                ),
                TasksList(taskList: tasksList),
              ],
            ),
          ),
        );
      },
    );
  }
}
