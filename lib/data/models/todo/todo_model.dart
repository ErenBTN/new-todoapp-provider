import 'package:hive/hive.dart';

// 1. BURASI ÇOK KRİTİK: Dosya adın 'todo_model.dart' ise burası da böyle olmalı.
part 'todo_model.g.dart'; 

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  bool isFavorite;

  Todo({required this.title, this.isDone = false, this.isFavorite = false});

  void toggleDone() {
    isDone = !isDone;
    save(); 
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    save();
  }
}