import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_app/todoprovider/todo_provider.dart';
import 'screen/todo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        title: "TODO APP",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: TodoScreen(),
      ),
    );
  }
}
