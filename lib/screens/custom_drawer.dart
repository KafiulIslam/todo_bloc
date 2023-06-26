import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter_tasks_app/blocs/tasks_bloc.dart';
import 'package:flutter_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_tasks_app/screens/tab_screen.dart';
import 'package:flutter_tasks_app/screens/pending_task_screen.dart';
import '../blocs/bloc_exports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          color: Colors.white70,
          child: Text(
            'Task Drawer',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, TabScreen.id);
              },
              leading: const Icon(Icons.folder),
              title: const Text('My Tasks'),
              trailing: Text('${state.pendingTasks.length}'),
            );
          },
        ),
        const Divider(),
        BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, RecycleBin.id);
              },
              leading: const Icon(Icons.delete),
              title: const Text('Bin'),
              trailing: Text('${state.removedTasks.length}'),
            );
          },
        ),
        const Divider(),
        BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return Switch(
                value: state.switchValue,
                onChanged: (value) {
                  value
                      ? context.read<SwitchBloc>().add(SwitchOnEvent())
                      : context.read<SwitchBloc>().add(SwitchOffEvent());
                });
          },
        )
      ],
    ));
  }
}
