part of 'tasks_bloc.dart';

class TasksState extends Equatable {

  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favouriteTasks;
  final List<Task> removedTasks;

  const TasksState(
      {this.pendingTasks = const <Task>[],
      this.completedTasks = const <Task>[],
      this.favouriteTasks = const <Task>[],
      this.removedTasks = const <Task>[]});

  @override
  List<Object?> get props =>
      [pendingTasks, completedTasks, favouriteTasks, removedTasks];

}
