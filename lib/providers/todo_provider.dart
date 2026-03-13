import 'package:flutter/material.dart';
import 'package:prov/data/models/todo/todo_model.dart';

class TodoProvider extends ChangeNotifier{
  final List<Todo> _tasks = [];
  List<Todo> get tasks => _tasks;

  List<Todo> get favorites => _tasks.where((task) => task.isFavorite).toList();


  void addTask(String title){
    _tasks.add(Todo(title: title));
    notifyListeners();
  }

  void toggleTask(int index){
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void toggleFavorite(int index){
    _tasks[index].toggleFavorite();
    notifyListeners();
  }

  void removeTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }

}