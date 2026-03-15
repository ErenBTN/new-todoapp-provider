import 'package:hive/hive.dart';

class TodoStorage {

  final _box = Hive.box('todoBox');

  void writeData(){
    _box.put(1, 'todo1');
  }

  void readData(){
    
    print(_box.get(1));
  }

  void deleteData(){
    _box.delete(1);
  }
}