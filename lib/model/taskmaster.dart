import 'package:flutter/widgets.dart';

import 'task.dart';

class Taskmaster extends ChangeNotifier{
   List<Task> tasks = [
    Task("Brush teeth before bed", "Important", false),
    Task("Read a chapter of a book", "Can wait", false),
    Task("Go for a morning run", "Urgent", false),
    Task("Take a leisurely stroll in the park", "Very important", false),
    Task("Write in a gratitude journal", "Mildly important", false),
    Task("Practice mindfulness meditation", "Not important", false),
    Task("Drink at least 8 glasses of water", "Important", false),
    Task("Call a long-lost childhood friend", "Very important", false),
    Task("Prepare a healthy and nutritious meal", "Can wait", false),
    Task("Learn a new language phrase", "Mildly important", false),
    Task("Organize desk and declutter workspace", "Not important", false),
    Task("Do laundry and fold clothes", "Very important", false),
    Task("Plan out tasks and prioritize for the day", "Urgent", false),
    Task("Write a heartfelt thank you note to a loved one", "Important", false),
    Task("Listen to an uplifting and motivating podcast", "Can wait", false),
    Task("Practice playing a musical instrument for 30 minutes", "Mildly important", false),
    Task("Write down short-term and long-term goals", "Not important", false),
    Task("Take regular short breaks and stretch", "Important", false),
    Task("Clean and organize every room in the house", "Mildly important", false),
    Task("Learn a new recipe and cook a gourmet meal", "Very important", false),
    Task("Play a musical instrument and compose a melody", "Can wait", false),
    Task("Watch an educational documentary or informative video", "Urgent", false),
    Task("Volunteer at a local charity or community center", "Important", false),
    Task("Practice gratitude and write down things to be thankful for", "Mildly important", false),
    Task("Try a new exercise or fitness routine", "Not important", false),
    Task("Attend a personal development workshop or seminar", "Very important", false),

   ];

  List<Task> getTaskList() {
    return tasks;
  }

  void addTask(Task task){
    tasks.add(task);
  }


}
