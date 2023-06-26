import 'package:flutter/material.dart';
import '../model/task.dart';

class PopUpMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteAction;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskAction;

  const PopUpMenu(
      {Key? key,
      required this.cancelOrDeleteAction,
      required this.task,
      required this.likeOrDislike,
      required this.editTaskAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return task.isDeleted == false
        ? PopupMenuButton(
            itemBuilder: ((context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: editTaskAction,
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: likeOrDislike,
                          icon: task.isFavourite == false
                              ? const Icon(Icons.bookmark)
                              : const Icon(Icons.bookmark_remove),
                          label: task.isFavourite == false
                              ? const Text('Add to Bookmark')
                              : const Text('Remove from Bookmark'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: cancelOrDeleteAction,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'))),
                ]))
        : PopupMenuButton(
            itemBuilder: ((context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.restore),
                          label: const Text('Restore'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete forever'))),
                ]));
  }
}
