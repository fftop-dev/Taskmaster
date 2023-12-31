import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:taskmaster/pages/list_task_page.dart';
import '../model/Taskmaster.dart';
import 'package:vibration/vibration.dart';

class ListTasksPageState extends State<ListTasksPage> {
  final double shakeThreshold = 13.0;
  bool shaking = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x.abs() > shakeThreshold ||
          event.y.abs() > shakeThreshold ||
          event.z.abs() > shakeThreshold) {
        if (!shaking) {
          String? currentRoute = ModalRoute.of(context)?.settings.name;
          if (currentRoute == '/tasks_list') {
            shaking = true;
            loadAddTaskPage();
          }
        }
      } else {
        shaking = false;
      }
    });
  }

  void loadAddTaskPage() {
    Navigator.pushNamed(context, '/add_task');
  }

  void toggleSort() {
    Provider.of<Taskmaster>(context, listen: false).sortTasksSwitch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Taskmaster"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: toggleSort,
            icon: const Icon(Icons.sort_by_alpha),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Expanded(child: tasksList(context)),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                loadAddTaskPage();
              },
              backgroundColor: Colors.pink,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Widget tasksList(BuildContext context) {
    var taskmaster = Provider.of<Taskmaster>(context);
    return ListView.builder(
      itemCount: taskmaster.getTaskList().length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            taskmaster.getTaskList()[index].toggled =
                !taskmaster.getTaskList()[index].completed;
          });
          if (taskmaster.getTaskList()[index].completed) {
            Vibration.vibrate(duration: 125);
          }
        },
        child: ListTile(
          title: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: taskmaster.getTaskList()[index].completed
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.pink.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              leading: SizedBox(
                width: 16,
                child: Checkbox(
                  value: taskmaster.getTaskList()[index].completed,
                  onChanged: (newValue) async {
                    setState(() {
                      taskmaster.getTaskList()[index].toggled = newValue!;
                    });
                    if (newValue!) {
                      Vibration.vibrate(duration: 125);
                    }
                  },
                ),
              ),
              title: RichText(
                text: TextSpan(
                  text: taskmaster.getTaskList()[index].completed
                      ? taskmaster.getTaskList()[index].task
                      : taskmaster.getTaskList()[index].task,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    decoration: taskmaster.getTaskList()[index].completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              trailing: Text(
                "[${taskmaster.getTaskList()[index].priority}]",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 9.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
