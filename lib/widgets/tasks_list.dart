import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/widgets/task_tile.dart';
import '../model/task.dart';

class TasksList extends StatefulWidget {
  List<Task> taskList = [];

  TasksList({Key? key, required this.taskList}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: widget.taskList.map((task) => ExpansionPanelRadio(
        value: task.id,
          headerBuilder: (context, isOpen) => TaskTile(task: task,),
          body: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(task.description,),
              )))).toList() ,
    );
  }
}

/*
ListView.builder(
shrinkWrap: true,
itemCount: widget.taskList.length,
itemBuilder: (context, index) {
var task = widget.taskList[index];
return TaskTile(task: task);
})*/
