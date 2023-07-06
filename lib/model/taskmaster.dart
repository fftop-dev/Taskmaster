import 'package:flutter/widgets.dart';
import 'task.dart';

class Taskmaster extends ChangeNotifier{

  int filterStatus = 0;

  Taskmaster(){
    sortByAge();
  }

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

  //0 = age
  //1 = priority asc
  //2 = priority dsc

  void sortTasksSwitch(){
    print('was: ' + filterStatus.toString());
    if(filterStatus == 0){
        sortByPriority(0);
        filterStatus = 1;
      }
      else if (filterStatus == 1){
        sortByPriority(1);
        filterStatus = 2;
      }
      else{
        sortByAge();
        filterStatus = 0;
      }
    print('is: ' + filterStatus.toString());
  }
  void sortByAge(){
    tasks.sort((a,b) {
      return a.id.compareTo(b.id);
    });
  }
  void sortByPriority(int mode){
    tasks.sort((a, b) {
      final priorityOrder = {
        'Can wait': 0,
        'Not important' : 1,
        'Mildly important': 2,
        'Important': 3,
        'Very important': 4,
        'Urgent': 5,
      };

      int getIndex(Task task) {
        int? val =  priorityOrder[
        task.priority
        ] ;

        if (val == null){
          return 0;
        }
        else{
          return val;
        }
      }
      if(mode == 0){
        return getIndex(b).compareTo(getIndex(a));
      }
      else if(mode == 1){
        return getIndex(a).compareTo(getIndex(b));
      }
      return 0;
    });
  }
  void sortByCurrentFilter(){
    if(filterStatus == 0){
      sortByAge();
    }
    else if(filterStatus == 1){
      sortByPriority(0);
    }
    else{
      sortByPriority(1);
    }
  }
}
