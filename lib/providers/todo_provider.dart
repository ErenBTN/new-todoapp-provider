import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prov/data/models/todo/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  // 'todos' isimli kutuyu referans alıyoruz
  final Box<Todo> _todoBox = Hive.box<Todo>('todos');

  // Box içindeki tüm verileri liste olarak döndürür
  List<Todo> get tasks => _todoBox.values.toList();

  List<Todo> get favorites => _todoBox.values.where((task) => task.isFavorite).toList();

  void addTask(String title) {
    _todoBox.add(Todo(title: title)); // Direkt kutuya ekle
    notifyListeners();
  }

  void toggleTask(int index) {
    tasks[index].toggleDone(); // Model içindeki save() çalışır
    notifyListeners();
  }

  void toggleFavorite(int index) {
    tasks[index].toggleFavorite(); // Model içindeki save() çalışır
    notifyListeners();
  }

  void removeTask(int index) {
    _todoBox.deleteAt(index); // İndeksteki veriyi sil
    notifyListeners();
  }
}