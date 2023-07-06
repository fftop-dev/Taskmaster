import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmaster/model/task.dart';
import 'package:taskmaster/pages/add_task_page.dart';
import 'package:taskmaster/pages/list_task_page.dart';

import '../model/Taskmaster.dart';

class AddTaskPageState extends State<AddTaskPage> {
  String _selectedPriority = "urgent";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add task"),
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
        // Disable the automatically added back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(
                context, '/tasks_list'); // Navigate to the main page
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Align the form vertically center
          children: [
            addTaskForm(context),
          ],
        ),
      ),
    );
  }

  Widget addTaskForm(BuildContext context) {
    final TextEditingController txtController = TextEditingController();
    Task newTask = Task("", "", false);
    var tasks = Provider.of<Taskmaster>(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: txtController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter task",
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: InputBorder.none,
              //hintText: "Select priority",
            ),
            value: _selectedPriority,
            onChanged: (newValue) {
              _selectedPriority = newValue!;
            },
            items: [
              DropdownMenuItem(
                value: "urgent",
                child: Text("Urgent"),
              ),
              DropdownMenuItem(
                value: "very important",
                child: Text("Very Important"),
              ),
              DropdownMenuItem(
                value: "important",
                child: Text("Important"),
              ),
              DropdownMenuItem(
                value: "mildly important",
                child: Text("Mildly Important"),
              ),
              DropdownMenuItem(
                value: "not important",
                child: Text("Not Important"),
              ),
              DropdownMenuItem(
                value: "can wait",
                child: Text("Can Wait"),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (txtController.text.isNotEmpty) {
              newTask.taskName = txtController.text;
              newTask.priority = _selectedPriority;
              tasks.addTask(newTask);
              setState(() {});
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListTasksPage()));
              setState(() {});
            }
          },
          child: Text("add task", style: TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(
            primary: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
