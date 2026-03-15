import 'package:flutter/material.dart';
import 'package:prov/storages/todo_storage.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                TodoStorage().readData();
              },
              child: Text("Read"),
            ),
            ElevatedButton(onPressed: () {TodoStorage().writeData();}, child: Text("Write")),
            ElevatedButton(onPressed: () {TodoStorage().deleteData();}, child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}
