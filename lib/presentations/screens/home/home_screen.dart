import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:prov/presentations/screens/home/favorite_screen.dart';
import 'package:prov/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 182, 182, 182),
        body: Column(
          children: [
            SizedBox(height: 15),
            // Textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(controller: _controller),
            ),
            SizedBox(height: 10),

            // Button
            ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().addTask(_controller.text);
                //_controller.clear();
              },
              child: Text("Add"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoriteScreen()),
                );
              },
              child: Text("Next page"),
            ),


            todoList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              context.read<TodoProvider>().addTask(_controller.text),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Consumer<TodoProvider> todoList() {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: todoProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = todoProvider.tasks[index];
              return Slidable(
                key: ValueKey(0),

                startActionPane: ActionPane(
                  motion: DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) => print("tapped"),
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (context) => print("tapped"),
                      backgroundColor: Color.fromARGB(255, 240, 10, 10),
                      foregroundColor: Colors.yellow,
                      icon: Icons.star,
                      label: 'Delete',
                    ),

                    
                  ],
                ),

                child: ListTile(
                  title: Text(task.title),
                  leading: IconButton(
                    onPressed: () {
                      context.read<TodoProvider>().toggleFavorite(index);
                    },
                    icon: Icon(
                      task.isFavorite ? Icons.star : Icons.star_border,color: Colors.yellow,
                    ),
                  ),
                  /*Checkbox(
                        value: task.isDone,
                        onChanged: (_) => todoProvider.toggleTask(index),
                      ),*/
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Center(
                            child: Text(
                              "Are you sure want to remove this  task?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          content: Text(
                            "The task will be permanently deleted with no option to retrieve.",
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("No"),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    todoProvider.removeTask(index);
                                    Navigator.of(context).pop();
                                  },

                                  child: Text("Yes"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                
              );
            },
          ),
        );
      },
    );
  }

  /*
  Consumer<TodoProvider> todoList() {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: todoProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = todoProvider.tasks[index];
              return Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(color: Colors.red),
                key: ValueKey(todoProvider.tasks[index]),
                onDismissed: (DismissDirection direction) {
                  todoProvider.removeTask(index);
                },
                child: ListTile(
                  title: Text(task.title),
                  leading: IconButton(
                    onPressed: () {context.read<TodoProvider>().toggleFavorite(index);},
                    icon: Icon(task.isFavorite ? Icons.star : Icons.star_border),
                  ),
                  /*Checkbox(
                        value: task.isDone,
                        onChanged: (_) => todoProvider.toggleTask(index),
                      ),*/
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Center(
                            child: Text(
                              "Are you sure want to remove this  task?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          content: Text(
                            "The task will be permanently deleted with no option to retrieve.",
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("No"),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    todoProvider.removeTask(index);
                                    Navigator.of(context).pop();
                                  },

                                  child: Text("Yes"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }*/
}
