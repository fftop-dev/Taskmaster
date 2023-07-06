import 'package:flutter/widgets.dart';

class Task extends ChangeNotifier{
  String _task;
  String _priority;
  bool _completed;
  int _id;

  static int count = 0;

  Task(this._task, this._priority, this._completed): _id = count++;

  bool get completed => _completed;

  set toggled(bool value) {
    _completed = value;
  }

  String get priority => _priority;

  set priority(String value) {
    _priority = value;
  }

  String get task => _task;

  set taskName(String value) {
    _task = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
