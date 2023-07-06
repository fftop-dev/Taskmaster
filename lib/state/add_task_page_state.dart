import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmaster/model/task.dart';
import 'package:taskmaster/pages/add_task_page.dart';
import '../model/Taskmaster.dart';

class AddTaskPageState extends State<AddTaskPage> {
  String _selectedPriority = "Urgent";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add task"),
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            loadListTasksPage();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            addTaskForm(context),
          ],
        ),
      ),
    );
  }

  void loadListTasksPage() {
    Navigator.pushNamed(context, '/tasks_list');
  }

  bool checkInputField(String text){
    if(text.trim().isNotEmpty && text.length <= 100){
      return true;
    }
    return false;
  }

  Widget addTaskForm(BuildContext context) {
    final TextEditingController txtController = TextEditingController();
    Task newTask = Task("", "", false);
    var tasks = Provider.of<Taskmaster>(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: txtController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter task",
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: InputBorder.none,
              //hintText: "Select priority",
            ),
            value: _selectedPriority,
            onChanged: (newValue) {
              _selectedPriority = newValue!;
            },
            items: const [
              DropdownMenuItem(
                value: "Urgent",
                child: Text("Urgent"),
              ),
              DropdownMenuItem(
                value: "Very important",
                child: Text("Very Important"),
              ),
              DropdownMenuItem(
                value: "Important",
                child: Text("Important"),
              ),
              DropdownMenuItem(
                value: "Mildly important",
                child: Text("Mildly Important"),
              ),
              DropdownMenuItem(
                value: "Not important",
                child: Text("Not Important"),
              ),
              DropdownMenuItem(
                value: "Can wait",
                child: Text("Can Wait"),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (checkInputField(txtController.text)) {
              newTask.taskName = txtController.text;
              newTask.priority = _selectedPriority;
              tasks.addTask(newTask);
              loadListTasksPage();
              setState(() {});
              Provider.of<Taskmaster>(context, listen: false).sortByCurrentFilter();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text("add task", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
