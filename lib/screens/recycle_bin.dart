import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/tasks_bloc.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/add_task_bottom_sheet.dart';
import '../widgets/tasks_list.dart';
import 'custom_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'recycle_bin_screen';

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const AddTaskBottomSheet());
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Recycle Bin'),
              actions: [
                IconButton(
                  onPressed: () => _addTask(context),
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            drawer: const CustomDrawer(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Center(
                  child: Chip(
                    label: Text(
                      '${state.removedTasks.length} Tasks:',
                    ),
                  ),
                ),
                TasksList(taskList: state.removedTasks),
              ],
            ),
          ),
        );
      },
    );
  }
}
