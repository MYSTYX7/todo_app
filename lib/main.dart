import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/provider/todo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ToDosProvider(),
        child: MaterialApp(
          title: 'ToDo App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            scaffoldBackgroundColor: Colors.white,
            brightness: Brightness.dark,
          ),
          home: HomePage(),
        ),
      );
}
