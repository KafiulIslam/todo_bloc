import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/blocs/tasks_bloc.dart';
import 'package:flutter_tasks_app/model/task.dart';

class EditTaskBottomSheet extends StatefulWidget {
  final Task oldTask;

  const EditTaskBottomSheet({Key? key, required this.oldTask})
      : super(key: key);

  @override
  State<EditTaskBottomSheet> createState() => _EditTaskBottomSheetState();
}

class _EditTaskBottomSheetState extends State<EditTaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: widget.oldTask.title);
    final TextEditingController descriptionController =
        TextEditingController(text: widget.oldTask.description);

    return SingleChildScrollView(
        child: Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                autofocus: true,
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter your Task',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                autofocus: true,
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter your task description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        var editedTask = Task(
                          title: titleController.text,
                          description: descriptionController.text,
                          id: widget.oldTask.id,
                          isDone: false,
                          isFavourite: widget.oldTask.isFavourite,
                          date: DateTime.now().toString(),
                        );
                        context.read<TasksBloc>().add(EditedTask(newTask: editedTask, oldTask: widget.oldTask));
                        Navigator.pop(context);
                      },
                      child: const Text('Save')),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
