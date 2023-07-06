import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmaster/pages/add_task_page.dart';
import 'package:taskmaster/pages/list_task_page.dart';
import 'model/Taskmaster.dart';

void main() {

  Taskmaster tasks = Taskmaster();
  runApp( MyApp(tasks));
}

class MyApp extends StatelessWidget {
  final Taskmaster tasks;

  const MyApp(this.tasks, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => tasks,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Taskmaster',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
              useMaterial3: true,
            ),
            initialRoute: '/tasks_list',
            routes: {
              '/tasks_list': (context) => const ListTasksPage(),
              '/add_task': (context) =>   AddTaskPage(),
            }
    ));
  }
}
