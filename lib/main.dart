import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prov/data/models/todo/todo_model.dart';
import 'package:prov/presentations/screens/home/home_screen.dart';
import 'package:prov/providers/todo_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Hive'ı başlat
  await Hive.initFlutter();
  
  // 2. Adapter'ı kaydet (todo_model.g.dart oluştuktan sonra)
  Hive.registerAdapter(TodoAdapter());
  
  // 3. Kutuyu aç
  await Hive.openBox<Todo>('todos');

  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}