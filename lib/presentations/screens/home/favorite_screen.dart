import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prov/providers/todo_provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          final favs = todoProvider.favorites;

          if (favs.isEmpty) {
            return const Center(child: Text("No favorites yet!"));
          }

          return ListView.builder(
            itemCount: favs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favs[index].title),
                trailing: const Icon(Icons.star, color: Colors.yellowAccent),
              );
            },
          );
        },
      ),
    );
  }
}
