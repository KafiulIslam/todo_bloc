import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/widgets/edit_task_screen.dart';
import 'package:flutter_tasks_app/widgets/popup_menu.dart';
import 'package:intl/intl.dart';
import '../blocs/tasks_bloc.dart';
import '../model/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({Key? key, required this.task}) : super(key: key);

  void removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemovedTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (context) => EditTaskBottomSheet(oldTask: task));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          Padding(
          padding: EdgeInsets.all(8.0),
          child: task.isFavourite == false ? const Icon(
            Icons.star_outline,
            color: Colors.amber,
          ) : const Icon(Icons.star),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  decoration: task.isDone! ? TextDecoration.lineThrough : null),
            ),
            Text(
              DateFormat()
                  .add_yMEd()
                  .add_Hms()
                  .format(DateTime.parse(task.date)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null),
            PopUpMenu(
                task: task,
                cancelOrDeleteAction: () {
                  removeOrDeleteTask(context, task);
                  Navigator.pop(context);
                },
                likeOrDislike: (){
                  context.read<TasksBloc>().add(MarkFavouriteOrUnFavouriteTask(task: task));
                  Navigator.pop(context);
                },
                editTaskAction: (){
                  _editTask(context);
                },
            )
          ],
        ),
      ],
    );
  }
}

// ListTile(
// title: Text(
// task.title,
// style: TextStyle(
// decoration: task.isDone! ? TextDecoration.lineThrough : null),
// ),
// trailing: Checkbox(
// value: task.isDone,
// onChanged: task.isDeleted == false ? (value) {
// context.read<TasksBloc>().add(UpdateTask(task: task));
// } : null),
// onLongPress: () => removeOrDeleteTask(context, task)
// //context.read<TasksBloc>().add(DeleteTask(task: task)),
// )
