import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/pending_task_screen.dart';
import 'package:flutter_tasks_app/widgets/add_task_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'completed_task_screen.dart';
import 'custom_drawer.dart';
import 'favourite_task_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  static const id = 'tabs_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context, builder: (context) => const AddTaskBottomSheet());
  }

  final List<Map<String, dynamic>> pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavouriteTasksScreen(), 'title': 'Favourite Tasks'},
   ];

  late int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(pageDetails[_selectedPageIndex]['title']),
        // title: Text('dkfakjd'),
        actions: [
          IconButton(
              onPressed: () => _addTask(context), icon: const Icon(Icons.add)),
        ],
      ),
      drawer: const CustomDrawer(),
      body: pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Pending Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: 'Completed Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Favourite Tasks'),
          ]),
    ));
  }
}
