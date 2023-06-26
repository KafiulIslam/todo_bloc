part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Task> get props => [];
}

class UpdateTask extends TasksEvent {
  final Task task;

  const UpdateTask({required this.task});

  @override
  List<Task> get props => [];
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Task> get props => [];
}

class MarkFavouriteOrUnFavouriteTask extends TasksEvent {
  final Task task;

  const MarkFavouriteOrUnFavouriteTask({required this.task});

  @override
  List<Object> get propos => [task];
}

class RemovedTask extends TasksEvent {
  final Task task;

  const RemovedTask({required this.task});

  @override
  List<Task> get props => [];
}

class EditedTask extends TasksEvent {
  final Task oldTask;
  final Task newTask;

  EditedTask({required this.oldTask, required this.newTask});
}
